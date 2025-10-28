Return-Path: <linuxppc-dev+bounces-13472-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58844C176BD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 00:55:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx6hJ4btjz303y;
	Wed, 29 Oct 2025 10:55:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=66.163.189.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761695744;
	cv=none; b=J89ZoHNrgYtyg2+WVBivh5dmysqCJCZCcvODAkLdIazbRgd+e5ZPyU1zh0EBG63AbET+k6CtzyXaCmV3Lg8XwwVThsz/kYbsh6hIz/uO59Ydm0JB5iMWvNpf6PEDqqK/tkDQFIqlXdlaCpKc7DarxvW1NDmfGjBJLDp+H3V0Ibz+N8T6DiTWPcrB6fs9yVwzKoFaBLpmbP0/QIhvxlfItkNbnd/0LQvueb2AYKl3n8SZtMboZ1zAgTWdAO1ZPqtCF8J+rcPM0SDon+kC9FdzqFgIU7w5pDPWY8I7usY0TnxYERpki6h9gkZ/bcO2T6Pw5O0upsc/x8RNpIJGaVSJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761695744; c=relaxed/relaxed;
	bh=NpjF0UIGrm/CpLEyYwNft0exYHMTbdFPf3y0B5sxB6Q=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:Cc:From:
	 In-Reply-To:Content-Type; b=Hx7L063/M/nYiBQWLeP7YPWZ75oAX2oAvOJ29lnEkx7nZ3qy6jWLmI7IM8RvhXvkgfRtqW8X9FDlqoI/xPTzK6oWZYG9S9PKxg9Fv5VcJSQCF63ses3fFuR8tjvFOo+ASorL730aiqdwzLFeDAb9nok5eFgh9GsUp9q1ynQfvqDOITSa2TgIBXNA/nFSvdpohsJawTqES+FvlxJ+sF/VFh7PdHP0qo+qrR5Mf+IDR78YZh2aZQRJb2R9RVrwes5eDEPvdvzEgZHyQwi3KJntDsGg3+mtI1UiI6nnpMolGjvJVXZ6ua7u3jhMwGeL5RryC5CMDOARTzkqPGEnfJEBtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=SwjQZNzF; dkim-atps=neutral; spf=pass (client-ip=66.163.189.147; helo=sonic314-21.consmr.mail.ne1.yahoo.com; envelope-from=userm57@yahoo.com; receiver=lists.ozlabs.org) smtp.mailfrom=yahoo.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=SwjQZNzF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yahoo.com (client-ip=66.163.189.147; helo=sonic314-21.consmr.mail.ne1.yahoo.com; envelope-from=userm57@yahoo.com; receiver=lists.ozlabs.org)
Received: from sonic314-21.consmr.mail.ne1.yahoo.com (sonic314-21.consmr.mail.ne1.yahoo.com [66.163.189.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cx6hG6KmZz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 10:55:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1761695739; bh=NpjF0UIGrm/CpLEyYwNft0exYHMTbdFPf3y0B5sxB6Q=; h=Date:Subject:References:To:Cc:From:In-Reply-To:From:Subject:Reply-To; b=SwjQZNzFQSnhzC8A3bw6nxQ8F9pcJcLahZLrUcppJwJo73ewgRe2z+lSFTtiHSMrT1q1hJ5xtM21gOPUYIIZ9co+mlx6BC5GmwJ1vP/gye+vUFyQKYk9aLkxtiLnbvmlfgspotR2XrjjvLDBMuehWhmuDTcCr60b403e0lzsqo7ah7YLdiw9fezx7WaKihE77tl1wkbYG9tfDkJto5Tccr9aqBTp8MdyHVf4tC7K2GoBw+y10LU9ti2hY9X+XuzEogqkPZFfd5Zm+Ps48+iqBRtki3++RFOnRPg4yDOKTNiaHuknwFcPTKqb97o4im/7pnHGVn/BXaXQLVgRGBi58A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1761695739; bh=M5icdA0EdZY/yWFpPG1ICw01/++h8wHUWUCfBypv5ye=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=nJhiv9Nh0tKtVAPtEPoScch7MidWhw/kTPIjdcamatjtSW6tkcSc9gm9TSXRHTM46eae6mOXz/eWyvya8itmcmGYOKSiCZI+VVXYifblu+FQT+qs4a0QR331eaIRk7Su6wPHcceB0iSLDto9UbrusSm14dYpH4xg3DzZBJGnPBqzZ7eRAiGapVhctp4+230UzFiBC86Ld0sMIZLX6Bbu7C9dY3pDw3ej866ueBMDDJNHVspxU9j7r6FJI0zg/Owvf2J4J8Oll21kPWMH634pugirsiNMEZGuJA80CT8PuPqGbFfUITTqDY1Bb0FQM+pERbtPjdpaNPF505B9VL+grQ==
X-YMail-OSG: .hMYkTQVM1moQee0bcN5OHwvo3.QPiNwmGLbsqid5feFavKtZ7QrFMpEkdhcpSO
 sk7alzFnplA62cdkgok98S4xIvqMpICODhpICn3xh01V09TDY8tOloWTIEnTzw2A0PJhlzl2axbY
 bZwiJsS3l7cdjoVkEMvSzxHz5FzfaOQ7ZEM6cvL7olH.9b2vO8cphLUHizhofTCsNrqEDE3EwnNH
 jAuBj7Ry0dWT6Ix0WuXZSCH1OvI2W6PCh.hhXHCtZcD0VDDbvKi7IUbAfy3xaLNKKZIVb7hAM8hV
 lniNhMstubwrWhd_f71w6T0df5ikYMaXklcbUsjOqiC.zfA._bYSSTkO1vLIQmo5n2ROdKMPikGI
 gp0YUMrT.dPlKVnAXRki9yXNLAeIzj4bY2Oo__Ih07PUAmJ.Kff28Ikkx2YQucrXuMShvztztmzx
 enmW1U759pJofZASpUPTM0650h410yTcT9jO366N2gR3GJVQX1CG6NtGB0ExzZ19eZDO.TNooPWN
 FmO5d5XzndapHvS3vdHw5h_Tw5Yry3b.lfXA3Lu0T60FCSoKchIKXR3jCmeynNzpy_naeVcN.2bs
 6uvXGv8DVwVJZD44y4tL9wTiEdwUC21UZ3U2uNGgiGgh4Cza8k2i4Vrp5ykgFJNOTl8BH81jihh3
 ylIjMsDbvhjkmY.aNmEbYDwKmdA_Hx8qjVgfrfyzeAagEjTBsEjoZEi3i_FiU0pAPBPJhEXNyDY.
 ruYVihT0CqkVUKTbFi1qBMOEJl0jFC1uN6XjJbthYXh1tEgZzIdW_VmShYUCFQQ_ub.gNkFpKVVg
 _YQU0XdemxAIqYPh05tySg2eOSNX8Oul2u_QF11TsPp6DkVvEY8Jfuq2VMj.oXo5AzbKVQHJxUHQ
 O7_QG1jczVqZyIFxef8D9PDkNVWBbMubipmemz7KEltwpXEPjSerjFU0P4BYCS.2udx1sbfTUmDb
 y7HP19tlKBUH9koTOW.GTg6yujDLtlZ4SCKj.Ma6_iXFD9G7X9w3vF3y7Mm27vcAQ5eEPPaMUmJQ
 xVe68l0.GOQ6b5X_0MW0XNdMUYXVbmP9spZiHHokfEJiW26xuNOntKfwLqSEJeEWkvt7eOjvwspB
 kci3XOMxIhE8bCHMVwKtX9.9rgF_pgrBqnPPb2thbysg7Nz9g6VcaanH6VkoJ52bgqh5GpqEt9Sd
 OKTlKeOYKJB5PTdJ60gi.SrINwLgMTGs2tNxhDI9XxLj4J6F2SLrOM4elHWskaY3PAHN1ykOcF1V
 XG2VG_pda2XC_uLVXR9VudNrtZWoEfdVFXIdNNkHvKyHZIuDCDUpd2s1NTczIj_R1XSi7Age36Bk
 wCZVajuU31ghiYO66r8etpWa_3rYL606V2NNTJf5Aes45EN8HD53x3vvuHM_a7G0TORtX2752qZe
 FNnzwEIrAOJi9b75vvXERVOeg0P3SpbiDfSHuBXQTFGV6WI3vM0PMeVb1cQWunwyU84DNSxGWXoc
 8xmb8Afe_Jg2iB0fxAFE3kvPG3MDYM4YzwbEthMHXDqntSR88lNWg8VVZB_Ac5btv.XOtZE0Hgtk
 bA_ypK6luziR5ITVaXhTnBiK6qgaUK5DGiLPxMfuuXkhQ4VXXF1xQt8AFNSYn3Twhh6F6oh0xbmH
 nl0On0P1SwYUqmsyTUhcDDGcCZN1AY1lqTJVxESBa0Q7p6MO11l2O_hvCrXGOJd3jal6aGTHSQBl
 pwePXiUlBfzXb90YmlTUkaTm03UpHPiO1xNEPYTLrRRNH6Jr4Q3_Z90NW7ynn059xN9MlvCnGjcw
 rLEzJma3JbCjO7yWMMkL2SxfOR2EL_ebsrGWBgrQNMP3ShUIpQFyUpv9pXKWFCz3HuQ_kNyGsPnW
 UuO4A8q0i6x5apZ.dKehOB9FtUsP6dGdmqCQdyKU656LRFj6EN3KHBC5qMUgGBfh2iCu3G3XC.T8
 bg6fkCszWPoTtotYWpKVqoWvXDf87wRtANeU7pTEQTu0LNFFb6XmwLVHOSIJrDg4B6BjyEUAhTvo
 b06WRvDC_u_cFoSaoKfVZbJo5u1BHy_yFgq2hjl4iPR44xrOD8hmAX3eMJXNMEElHhFVbqbz5tIU
 mob7VURWZT8JAVqZh0NR27ES3yNHLa46EVvCDMMbB7ZzcF24OoNpZch9UFXPsKjxKqkagEvw36tO
 eQiClEAeK.Du6iGocby1HbOS9bJHBvpM_FnweFlplIPgoev_3eqrdpYtAaUwB1T7LXDJikfA4YNi
 0lrIGumcWo5AnhzgxyaJtq8bt4WaWjPlc0IdwiBn7VVYTHNzi09WVvFoiqQaQVuwO5xXJDo_v
X-Sonic-MF: <userm57@yahoo.com>
X-Sonic-ID: 503abb31-7663-4ca8-a4db-00bd5795d840
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Tue, 28 Oct 2025 23:55:39 +0000
Received: by hermes--production-ne1-5f94788784-mwgxs (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d8330c0014dbdfc8738b2aa490522cd7;
          Tue, 28 Oct 2025 23:55:34 +0000 (UTC)
Message-ID: <78e43ec2-a60a-9876-9f03-c0ad92b7da1d@yahoo.com>
Date: Tue, 28 Oct 2025 17:55:33 -0600
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Fwd: Excluded List for "#size-cells" warning
Content-Language: en-US
References: <70d76dcf-c7d4-43c5-c169-07054a37195c@yahoo.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Rob Herring <robh@kernel.org>, Finn Thain <fthain@linux-m68k.org>
From: Stan Johnson <userm57@yahoo.com>
In-Reply-To: <70d76dcf-c7d4-43c5-c169-07054a37195c@yahoo.com>
X-Forwarded-Message-Id: <70d76dcf-c7d4-43c5-c169-07054a37195c@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.24652 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-------- Forwarded Message --------
Subject: Excluded List for "#size-cells" warning
Date: Tue, 28 Oct 2025 10:00:25 -0600
From: Stan Johnson <userm57@yahoo.com>
To: debian-powerpc@lists.debian.org
CC: Finn Thain <fthain@linux-m68k.org>, Christophe Leroy 
<christophe.leroy@csgroup.eu>

Hello,

On a PowerBook G3 Pismo running the latest Debian SID, dmesg reports the 
warning shown below. I've also seen the warning on PowerBook Lombard and 
Wallstreet systems. I haven't checked PowerBook 3400c or Kanga.

According to drivers/of/base.c:

-----
         for (; np; np = np->parent) {
                 if (!of_property_read_u32(np, "#size-cells", &cells))
                         return cells;
                 /*
                  * Default root value and walking parent nodes for 
"#size-cells"
                  * is deprecated. Any platforms which hit this warning 
should
                  * be added to the excluded list.
                  */
                 WARN_ONCE(!EXCLUDED_DEFAULT_CELLS_PLATFORMS,
                           "Missing '#size-cells' in %pOF\n", np);
         }
         return OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
-----

I'm not sure how to request that systems be "added to the excluded 
list." Hopefully someone who sees this message will know how to proceed; 
I can help with any testing.

thanks

-Stan Johnson

-----

[    0.215282] ------------[ cut here ]------------
[    0.215587] Missing '#size-cells' in /pci@f2000000/mac-io@17/media-bay@34
[    0.216349] WARNING: CPU: 0 PID: 1 at drivers/of/base.c:134 
of_bus_n_size_cells+0xc0/0xd4
[    0.216904] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
6.17.5-pmac #1 NONE  f49e64e4b2bea9e24fad7a6e054c9fb4afe07547
[    0.217582] Hardware name: PowerBook3,1 740/750 0x88300 PowerMac
[    0.217953] NIP:  c048b9d0 LR: c048b9d0 CTR: 00000000
[    0.218268] REGS: e101dae0 TRAP: 0700   Not tainted  (6.17.5-pmac)
[    0.218652] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 28000422  XER: 00000000
[    0.219124]
                GPR00: c048b9d0 e101dba0 c1060000 0000003d 000000eb 
e101da10 e101da08 00000000
                GPR08: c092d09c 00000000 00000000 e101dba0 48000422 
00000000 c0007a54 00000000
                GPR16: 00000000 00000000 00000000 00000000 00000000 
00000000 0000010a c070c25f
                GPR24: c124f418 00000000 e101dc44 e101dc50 c0630aec 
c0727584 c06d21af dfffcd34
[    0.221406] NIP [c048b9d0] of_bus_n_size_cells+0xc0/0xd4
[    0.221745] LR [c048b9d0] of_bus_n_size_cells+0xc0/0xd4
[    0.222080] Call Trace:
[    0.222241] [e101dba0] [c048b9d0] of_bus_n_size_cells+0xc0/0xd4 
(unreliable)
[    0.222695] [e101dbd0] [c0491844] of_bus_default_count_cells+0x38/0x44
[    0.223116] [e101dbf0] [c049165c] __of_get_address+0xc0/0x178
[    0.223487] [e101dc30] [c0492154] __of_address_to_resource+0x38/0x20c
[    0.223900] [e101dc80] [c03b1334] macio_add_one_device+0x210/0x48c
[    0.224318] [e101dce0] [c03b1718] macio_pci_add_devices+0x168/0x1d8
[    0.224723] [e101dd20] [c03b0c50] macio_pci_probe+0xc4/0xf0
[    0.225088] [e101dd40] [c02fab2c] pci_device_probe+0x88/0xf8
[    0.225457] [e101dd60] [c03973d8] really_probe+0x140/0x298
[    0.225826] [e101dd80] [c0397758] driver_probe_device+0x38/0xa8
[    0.226211] [e101ddb0] [c0397994] __driver_attach+0xfc/0x10c
[    0.226580] [e101ddd0] [c0395544] bus_for_each_dev+0x88/0xc4
[    0.226948] [e101de10] [c0396414] bus_add_driver+0xb4/0x1d0
[    0.227311] [e101de40] [c03981e4] driver_register+0xd4/0x110
[    0.227682] [e101de60] [c0803298] do_one_initcall+0x74/0x1f8
[    0.228064] [e101ded0] [c08036f0] kernel_init_freeable+0x258/0x264
[    0.228465] [e101df10] [c0007a78] kernel_init+0x24/0x12c
[    0.228820] [e101df30] [c00132fc] ret_from_kernel_user_thread+0x10/0x18
[    0.229260] ---- interrupt: 0 at 0x0
[    0.229493] Code: 40a20034 3d20c095 3929eb54 89490001 2c0a0000 
40a20020 3c60c072 39400001 7fe4fb78 386375c1 99490001 4bba10a5 
<0fe00000> 83ff0034 4bffff70 39610030
[    0.230502] ---[ end trace 0000000000000000 ]---

