Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB13DC7A5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 20:25:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GcXkp2M4Wz3cVD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 04:25:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=RzWNt86K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=66.163.191.147;
 helo=sonic304-21.consmr.mail.ne1.yahoo.com; envelope-from=userm57@yahoo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=RzWNt86K; dkim-atps=neutral
Received: from sonic304-21.consmr.mail.ne1.yahoo.com
 (sonic304-21.consmr.mail.ne1.yahoo.com [66.163.191.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GcXkJ5c8Vz301g
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Aug 2021 04:25:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1627755906; bh=NbIOQi1dtWxWRnD2A5fEcx4q/YAr0GojReCQw/awfrA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To;
 b=RzWNt86K/wYuJ9SRcvCgL0TqiaKeOIDPk5W7yFFDZY4clEE3rLpCAUytGMx6VlNdBt4gCmyHi9rdn+U5Q7jigtBQciW6vUvRrerr80KXmwaJuLZnidkWjIvRjgtLmv/cK5Z/ymsbS6aaWg3mT0UkcN7t56CJYHwDalyGURID8ihHyb11qnNuNXPhh3qS7Nc4NqM+AeG2hzJFmuLVFv50CryqQVZeeaj+o2FK/Q7r+42RDpV6TQriBI7mDmdzcWtA54VRqM0nUKuyR7EdOutEUUo7jNItMMk2iG33AXlnGfTVZ4H5Onnlb6vKFcT/pK33C0pXdkXRf5Ioufw8uAJ0Uw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1627755906; bh=WXC2A9+LPn3C2tZii2Y8koDlq2T+hQOFtcO+1Mx0PhV=;
 h=X-Sonic-MF:Subject:To:From:Date:From:Subject;
 b=Q6Odo/pi96JOHGBEbCg7y3RF5bTWsUKeBIt0XlYdWR4+dLkVka0EtYj+pjJIpERlE6i7RQxqdjSiwDtyVcVgCCmchf+jwM5ojvg/aP8hXOT25B2fddppTLLABw1MsKTHwl8NFHHfpwpqEn3HJjg9XXus4lNFPHKAUeiAvVxQUBFz7wRJ//G98pWxOdmgn5CqnomIKVLLJ4A9KqD87lVXEr2jyoX/JCxo5IN1ckqSUXy8pwSDKOfzjiUUrJJNEYlxostytBWZQ9UWmWgC4mWHocOPbUyLod/KXfd7o18RUNZYitwNsZTYSCZtLC+3htWrCoBspVa1MzSgJrjHn2y08A==
X-YMail-OSG: y.DwxDgVM1kF7k119sxKiKO9JY7Uht1C9Bk41Z132RnSABgDHaHedROUEfxx86F
 9ITSede4vvbx_q3l_BirmDM5jIi2Y1HrknRNyLW6qD9P6E2ZhrDieWdJ5NW2Z2t48.njo5T60mlR
 nB06VOilWPG0nESjxeWjEmUQEfF6VMqcrgxykEZNUf.SJJZLHMQlr7KU2hcLtEmhHqjP.SPsw1h1
 pom4cBTmI5sN8AE3iCi5G3R3gHS7OrLt5puISuY2czvMKlvSSWeflhey9.yePpem_XlGm.OSBYz5
 BfVqlhYtYRfaW.Mv8NbrwWHzlnUQFwvioszJLNev94zfNYDTAaimg1GOfAZWgeZN1zpRaRAsNyLo
 n.Nkcy2YPAnhAqz60ibvxo38eBBudQxq9gbBLw_dMMjUSeiQxhhdVLNI00tjZ1Q6eiJLT8UIPyFG
 Hs9jJzx7rkjlvSEBPamBVbyHoUsX7yyAAFSLZlSld96lLUdF7m6jKzxPSPswdcOt8r2Ighx2priC
 KNfBGi39zbyb0KncHmEYmanMxIbrSiEMvcDjq7KQIYrCuTnMCVXC0EkBtjl6Yb7LkXaKx1UWBtNM
 uIxfaUSTgt.e9YqvhtBKQWoBgt7JTwJStIPTIL0U8IlM1_yrQvQYadBnRf1frYN4xyBoRluAIX9x
 NNvUnOPO_4M6CGvn4a7UtyXwuXEMJjJ54VP4ELOjbVVhVcoQCyuR2WPJYTesckSVEsm1pJbWp0Wc
 9jzTmTr5f7pu_Vyjk6mwmfitBkK37MmOXIGbRH3TvMY_4tXGwAax7o7S.9Sy8tn5GGFTP8gYQfu_
 QabGKhPnthKvnV.bWNAPVS2rXn8_6B0elhM01n5WuRaAE8Swh6GKAF6KDb0WFoqF4JyNrVOIIx_A
 1k8yzG9NUDpp0KAx2jjYUv4.IpGaj1SAVR06LqjhsaGf0YojpAUccoMf5fCxvD9JpQe23l.7C3H8
 1rnb8n7DRpOH1MDjjE0t30RkNDeYkLu2esFuNmB7p9nrcVNy.5CN_eY73WTOJhbgmAaqOPPXwRbT
 pVW.UZu8tN7G10xqvmvhTXCZwGWv42bWhQFzgQ718RrtrrN_k8ioEUBTxlZFRrYvlqmagBoScsJW
 GLUYiyCBukcXyTJeo6Oxmv9UEa4naK7zCDptMib6xA6ICUuEJxNT9TCm8KVYb2USkWpw8TyqWYBy
 bSxOc9JmwqyxPu6LOugttHvVmhC.H_kx64I2Irqy2msl8YyQZgITBAZoogjPQbbN7N63fJSrh65W
 1bPTbypjr3puStgVrh8YqkgEwkcY71.AvxLjpLYU7y4GDfXHexdzsq3vauedw2t0T4UMnqsSteXd
 QNFfn.eJXxcnBan9gnG.NyWiHxe4Yv0.8leIPHhIMMdFPM.kJfuvDy2xCq7mW0rETVoOt5zHtktl
 GFGH4PlWFEoHcds3h1FRAu2l5iVZPtnqx8T1S5uwBaTkK6LHwSDeHXuqoIlJpBYZVeL2nITyq._h
 HKj4zWpn4l4qiHmAk2MGrxfB.l3nvtachiRkfAlIJrv07O5y5CZG5kgj4TKgTobrDOiCl0PbpSDW
 9zzMW08inej.DpqZKNFcRk1dsfVi.B4mCAr8Ql24.adYyoh1tEz0.5leRSzxTGQQkx08fOCWHqVr
 Fq6nm3uQZkm4d2HPjULs.rBzzo.ICejmKNn4xpVK.gC2kOTQu0G6Yvk8sTr0.tHS2vg4rxuc09rh
 LGR.SzYpIolueLZTJJx_xpoJvPxdAb7cGKbFw9J7kw4IEC9nMJ70Ixka_dDjd2kgJjDib4e1nyb_
 LXQLqvch1i_xJA.HZI0Q68ykU09TtYGz9Q4mTqh1Sm8T7PJNjJh_uMoE.Vkl.AMiZnsgGcR7zAKY
 ItWJC35bhzP5wL2HuPOBZzRi.r0RkdrvxSV6SjYBindQNSN3JIGevOAr7_UHiU0nLRNX1paG.lsx
 zfN7u.P1lnjDiJAW.b0jCgy0vbbO1w0_6hAahPy3NEMRxmUEYhRE4U4YOeBBouOtIdQPZoFUFbP3
 Nf5h_C5_xbgKQEoa54Tsnr0VXe5WU2QZOY1JiFBkkTmeVt_DCmDEsBVDMhHseG0zelqc6o1TW0Yk
 sciU3Vj5_wjEQXCckjaxaUrnpWDlTBJeBfqldEbvBeJE3FdfSrDde5hpmeeVkXlgppljVLlJFTKE
 q2vZE1FOiK2d3DCvfulnLaP40k0R_SLwOT9FiyMH8P5I7yschDbNAEMBbBKwyFA37o7fKEVK0F6P
 pMK.bVAX.x4vXnq_rvL7aAY4cutNeNT68NVKK.vFr8liwzboy0PPxM5RZIydo8m02PRn.hCIthNC
 p_iUkAo039dGsq7EiW_cmdrnxheC4mob_eNTtG_5KZGTYAlNccwwyk0pduPvE.lMthCi6U.mjImR
 xnZlrqxFcSARzDOzlLNw1.z03IaQ5bRpEYn0J9GbLS0jLA5qb5VmsFKjNambEfJhtdOKfsrJ557z
 hU53gab2USnVann0oUh.CQEOpgeQeaOGlwujYj5cMeC9O9pSDdPCMUqtNWlBggjR8gnylbe5b4q_
 f9H0CzyuDzhySF9ytMH8PjEOq.dm8QUmTI4XeRR02zCzj_owlWp78n2gXiBDewM4YzScTbUtDANS
 QRrgdubaRen9as1yQYLCxMA3u1wt5ABc8SnV5cBkiPLzQ4dO4NAZTLFsqe3QVspYqa.Q4onVmjlP
 _ocM3jok4lN24vqsRsXnTRGGia.WvGqmTMdLqnIzBlIqZWXf9DJrSUz9d7DVPIC4F
X-Sonic-MF: <userm57@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ne1.yahoo.com with HTTP; Sat, 31 Jul 2021 18:25:06 +0000
Received: by kubenode531.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 33664c0d36ed30bef40b13577008ba6b; 
 Sat, 31 Jul 2021 18:25:02 +0000 (UTC)
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
 <60841a75-ed7c-8789-15db-272bf43055f5@yahoo.com>
 <20210731175842.Horde.UunWM8rZMP0dRCaeWUo-og1@messagerie.c-s.fr>
From: Stan Johnson <userm57@yahoo.com>
Message-ID: <cd7c931c-a578-a2ff-0632-7767a0e90bb9@yahoo.com>
Date: Sat, 31 Jul 2021 12:24:45 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20210731175842.Horde.UunWM8rZMP0dRCaeWUo-og1@messagerie.c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.18749
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Debian PowerPC <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org, Finn Thain <fthain@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 7/31/21 9:58 AM, Christophe Leroy wrote:
> Stan Johnson <userm57@yahoo.com> a écrit :
> 
>> Hello,
>>
>> The current Debian SID kernel will not boot on a PowerBook 3400c running
>> the latest version of Debian SID. If booted using the BootX extension,
>> the kernel hangs immediately:
>>
>> "Welcome to Linux, kernel 5.10.0-8-powerpc"
>>
>> If booted from Mac OS, the Mac OS screen hangs.
>>
>> Booting also hangs if the "No video driver" option is selected in BootX,
>> "No video driver" causes "video=ofonly" to be passed to the kernel.
>>
>> This is the current command line that I'm using in BootX:
>> root=/dev/sda13 video=chips65550:vmode:14,cmode:16
>>
>> Kernel v5.9 works as expected.
>>
>> The config file I'm using is attached.
>>
>> Here are the results of a git bisect, marking v5.9 as "good" and the
>> most current kernel as "bad":
>>
>> $ cd linux
>> $ git remote update
>> $ git bisect reset
>> $ git bisect start
>> $ git bisect bad
>> $ git bisect good v5.9
>>
>> Note: "bad" -> hangs at boot; "good" -> boots to login prompt
>>
>>  1) 5.11.0-rc5-pmac-00034-g684da7628d9 (bad)
>>  2) 5.10.0-rc3-pmac-00383-gbb9dd3ce617 (good)
>>  3) 5.10.0-pmac-06637-g2911ed9f47b (good)
>>     Note: I had to disable SMP to build this kernel.
>>  4) 5.10.0-pmac-10584-g9805529ec54 (good)
>>     Note: I had to disable SMP to build this kernel.
>>  5) 5.10.0-pmac-12577-g8552d28e140 (bad)
>>  6) 5.10.0-pmac-11576-g8a5be36b930 (bad)
>>  7) 5.10.0-pmac-11044-gbe695ee29e8 (good)
>>     Note: I had to disable SMP to build this kernel.
>>  8) 5.10.0-rc2-pmac-00288-g59d512e4374 (bad)
>>  9) 5.10.0-rc2-pmac-00155-gc3d35ddd1ec (good)
>> 10) 5.10.0-rc2-pmac-00221-g7049b288ea8 (good)
>> 11) 5.10.0-rc2-pmac-00254-g4b74a35fc7e (bad)
>> 12) 5.10.0-rc2-pmac-00237-ged22bb8d39f (good)
>> 13) 5.10.0-rc2-pmac-00245-g87b57ea7e10 (good)
>> 14) 5.10.0-rc2-pmac-00249-gf10881a46f8 (bad)
>> 15) 5.10.0-rc2-pmac-00247-gf8a4b277c3c (good)
>> 16) 5.10.0-rc2-pmac-00248-gdb972a3787d (bad)
>>
>> db972a3787d12b1ce9ba7a31ec376d8a79e04c47 is the first bad commit
> 
> Not sure this is really the root of the problem.
> 
> Can you try again without CONFIG_VMAP_STACK ?
> 
> Thanks
> Christophe
> ...


With CONFIG_VMAP_STACK=y, 5.11.0-rc5-pmac-00034-g684da7628d9 hangs at
boot on the PB 3400c.

Without CONFIG_VMAP_STACK, 5.11.0-rc5-pmac-00034-g684da7628d9 boots as
expected.

I didn't re-build the Debian SID kernel, though I confirmed that the
Debian config file for 5.10.0-8-powerpc includes CONFIG_VMAP_STACK=y.
It's not clear whether removing CONFIG_VMAP_STACK would be appropriate
for other powerpc systems.

Please let me know why removing CONFIG_VMAP_STACK fixed the problem on
the PB 3400c. Should CONFIG_HAVE_ARCH_VMAP_STACK also be removed?

thanks

-Stan Johnson
