Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C562F3E357B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 15:10:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhjQ05Plsz30GH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 23:10:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=qoq4Aeqw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=66.163.186.147;
 helo=sonic302-21.consmr.mail.ne1.yahoo.com; envelope-from=userm57@yahoo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=qoq4Aeqw; dkim-atps=neutral
Received: from sonic302-21.consmr.mail.ne1.yahoo.com
 (sonic302-21.consmr.mail.ne1.yahoo.com [66.163.186.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhjPT1W5jz2yX8
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 23:10:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1628341799; bh=JVIh0Qy0IhVrSq5bk3F8fOms9/M//DEgOx5iD1Do6fQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To;
 b=qoq4AeqwZnsPHltCo12/BHjrr7mkRxfPvUXnUBJuiqt9hN5ZVDAZxhNIvU87BZGcHwYu69wGb3FiliEyLhq4r/TFNCDAwW1BcI9h6hPfC4fSzmTKbNdayEFsn8Kp6fNOfXWkkI+avGRAhLdTmiMLKoY0vCjDhl41RcEl+654abcadWoK1BNAKK33pgaaamu2ffv0YKb5zdcvx46X2wCYDsmNgj07t7HAjoJxnSF4Qu+t1ii/E612F2JUnzrkRIcEfa0TI0k/EwNSZo5D/tsW9fuCSCZ1lwfUk6C3fkS83FjlzIeHH4HmnH5vNfrmBt9XQt1hXwedMrDDZTFg05MIAw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1628341799; bh=6XnUtwGfM4Uo6JI8yR71kPZmV2nOD1WfiHcExLl0ZTs=;
 h=X-Sonic-MF:Subject:To:From:Date:From:Subject;
 b=K2TWOM8FM12sDKYCL1j4TG8pWeus75NSzHZcsbGYTIHS8CtcK5OWBkyKqLbFC5pvlCnD0ih8AFQc6S7FrCTu7OdHZz7Vg0dUNdg8OWW4X74Tc7yZpMfKBBNwtxD94ekW/H7apwHXS9PPIu9PgSZMYoeDj3tw4kX8GGcOhYCzrrT4xUTlEJNgKHi5foFwVOTvTN4T5hQfFdlWqem7ShV2aj6anQXrgYNT+Rs7FctcuWPAaeQ6PCIJomd05nV0mmKBejyRpKs5vUW7pc1B1EGnpSqsp46ibJw/EDeU32MDcp44I/+IGXVIBUILBF1F7eKoHJCls4/NJuQ80G7argxEZw==
X-YMail-OSG: D2pvDZgVM1lzKlZWV0xmvFIbEESuEcmfGehoF7xG.gX2mkpNJNo8ZLfLtbn8ReD
 Rbtp_bJJsTDmixlVB1d4dQGO4Qb.cZB7nWRCR4mPsl1m009TwQcBWSeji4GTuyc1VMxoI.4HbEzE
 c4uzE2skMVd9dZUS2Hzuh09TxrAXWgGJE77BtvXvBJCyJ2efTKf3JzzUe0HSIJ.5nDm0UgJt.Dz9
 dVp46XQak.MD2k8scRDvu7qe_K4OED1G9TFQhoA8ewrlDPH_Vicvq52OoZstnd0MentzhwL6E9XC
 WyP.zyz4RLneRIqyM0dbBxyGAWN43P_T9eKuswlk5Pi5maLMbDRB9M_4vOWm2kIAoAmeW1npcD.P
 h6m0T_iL.hlpRTbL7Rgq.vC26T8iahHm5S_.tlQ5TuqI0WVL24.Wg6guRrR2GoUjsWv9eK6_ED5X
 2usBqEQyYusk0HvyXyHOSJFMnKW2o15GiP3gNFwbXcCL6BpcQc1_Vtow1F.AmEBJhyBz1sriGDaU
 qXImO65APlD2gYJh6WAuf_qgu3zxpvPVq5pVMP_Iggq1XYfM.KfozT7KyhAJHItgrst0m.9fa3A2
 AdWaUSu53r__q5MCVk4jfDA.gAu2sb8_jbpIEEJo5nqP3jarMPaFiGBtP6_umVu.cQnPRdCtXAL1
 3s6QKEDo6w4r2De9ub.4QW.qaYTnwtGmS.tg5W0y3aWuWmlQrrQQCVreAxj9npxdTvNUkaV02PIt
 wxn.S1eAAKrwQ1oc7VLqUkFURwQFMXkOxIxCWn7oG_146bWA0kbbKTV5uwQIhKUOZoiGUdaoqxS_
 opmDmHO08o3IERHHJQTebmCkBUK8kCGi37RAiRPiCT1eJdy4HPGY56rJIuUUoO.V8Q9r7X5B69l4
 l6bo.95rY0QWY8Rf7m_dhWBVy2Oa1oSvcLBVCGH7x0H4tYW0DiSb.9n_76eGOVsMZ4ouMxpJf6TU
 IDGkrMQXxjAAvU18jwpOD0.hohup9_Ci0_kvn6yk_eUYyLVa1FxUVhsaXlFPtUvDSwSQFFe6aHdI
 xr9j1z333xSppkrhaCxEqM.oHWLGoAps818Zfvbz_8EXfEVKP8FPGhypFnZiA5jy1hQejW17nATO
 5i0pXgpQJsZTUJhGJ6VxOGihTiLvP9zDIqN1vWRM7bi6pn83dcKFoApSo3lHMAydr.0KA9hOW44e
 9T0vnxBOI85TgIkv6G42jjBAZAgomJuhxG_W5_3xPnSwunazJvUoCetQGwNU1ryiad9.qqhAb6xm
 dxcrVEZhq2gU6YxVD3QK2ZmoqDizCnmTfDPB62ClKQRHiq03GGWe16hY51TjeBu6fjsanZo651dX
 XdnNFF39CzAbEl4wk1K5ucmhkrEGOlURw54kyPilDZMo0eFOMbQPSURlzNena8w6iFPhhm1li47G
 l8UwcVOeHOVdFN_GqV4wG3KY6PBywdBBP.ucV9wiJbfaA3gQ.Vqb5vnJ1DeT79Cc7C73Nxx_Mi9V
 Tqkfi3_46QHumXA8r7R5T1UA3f.Ky6hWWfIJLMS4Qbgjc5NKCr252u0SWCDYmPKSXY.7t9IXUANU
 SjB7zhfTWPOjUvYPsQT9vSkOvdufq.bEN3k85LIh7tDtxzLn_DX5t1CE0wU_FCM4JnVen7M11G_Q
 tz9Q7NR_9Bf7B6Imsee.nBcBjNsqbknmfI.ADwEg5Dafjarq35X51ANI._89zGzcYGt.gecIIfX6
 YjJZMfXtUDJCEjm4AiX8sekaUm1B7KlIeFTi8xezfO88OonKeMugrY32WVLXzfbB0NydARpmAhke
 bExuQRwDU5PSRzt2gGxMCXo5PGNH3azy0S9qUszKCWihA56cGy_PRsqf81bUWTAmcjLT2JlDvH1l
 w5Krq8MeVmy61hqR5oNk7gLVm0f5yJFVN4qNdKVlDMJXSEoHPT1Nw8wDKt.ZoPFCSF1ceva2LSXM
 tvCgHb5vkGEsd3XZCALuvp7BfiWOlLYGLohP.JGUP2SXdaKOUwhLEpkfXy.D9O9xwVR2xYonFoPU
 7yAEfLIFw1aLYWqHCqeTuz0CXnR_Vlrkt1pBOAXhFTRYE6UCBxch9bIEJZoOVG7uDeg9kawEYT.B
 1qKmCo9yQAVXHsFivrVZ.ptNvkPPKuUuuB9thaeMsxPpc2WcIikl_mwZuIHfv6Mmm2js4slmZcDS
 MzXaN2b0wgL.kRzDjBcpvFVa2E5i54VV7J6KFevaAKxxTqfaajC05WIInJT.Y1yuSR_64eHrRL.M
 Tvwjp.CLG1cQhwQBIQ3j2Y0XU1wN8JWL_piXi_vCQvgrvjA_y9Q9_FTccNcfFbHXDX_bz7F9upd8
 AabEksIh8uLzPiwadlnTWhPTflSKeQDC9hL4giwWGleh6MkYc7ZzfXYeRZGABhzmMH0C8tkp3d5Y
 11BbII4UOR5IFslDEq2W69feC0RtE0vfHjND4rWwFCEjTcZ6YqSFmzXsJp7rWApwtGHYjrlifQHX
 cZ4aC_2VCNB6ZYuSL1oMVU5VKc2cD4fSNZ8RA1qD2npIr3nHS9VFrHSeHET7dqocRgIKLdGedYiO
 KNu5kIPUU1WZRypQfIIgnXM1fmpGKmp9bjOsrLC4ABbG7Hx3ilhHq4QCKJ37XgKAdIoZjzo.uVen
 jqjBfBtAGAEeuZHKwf86f.B6ny1dmA48Bz_C4Yfjb2uKDiHSqgeYzRrKs9eLIvfxIk7KAWDh.axV
 9JAZRIbRVlQDIjbbmVDagz_3fYcEPJYJj5WwSI9oaoMv9alAiDMbXrQfVOiRN5uCdtI3Aed.hyk0
 0MUtvL59cCAYH5vNg8iOAZQh0_9.kt9ga6YE8wvqAGe51I4GPvfF2lFMxU0Cc_cXp
X-Sonic-MF: <userm57@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ne1.yahoo.com with HTTP; Sat, 7 Aug 2021 13:09:59 +0000
Received: by kubenode541.mail-prod1.omega.ne1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 88e2418bcd298f6686a1e1c5fe41e0de; 
 Sat, 07 Aug 2021 13:09:57 +0000 (UTC)
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
To: Finn Thain <fthain@linux-m68k.org>
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
 <c535cc2b-3f45-2415-1e81-32ea24b4ec@linux-m68k.org>
 <b8ae2ca4-56e8-e39a-27a0-f0ee2fea1511@csgroup.eu>
 <f6a3746e-80ef-a6b3-925a-69aed01ba98c@linux-m68k.org>
 <b6fe0c8e-8af5-e0e9-629b-fce61750ec2e@yahoo.com>
 <4ac28304-4519-fb8a-a868-e8c79cb5f9e4@yahoo.com>
 <7532219a-4fd0-416-6365-304033fa6abd@linux-m68k.org>
 <9659419d-da9e-5aa6-ffbb-758748e2d6e9@linux-m68k.org>
 <2eb2b452-51d5-c495-3ffe-896c62a1633f@yahoo.com>
 <da9c16b4-70bc-6fe0-ad5c-8b226ca08b23@yahoo.com>
 <cc5a203f-9df5-a0b-a4d7-bcaddde777d5@linux-m68k.org>
 <6ea50cd7-84d3-5180-0430-1211aaf0e308@yahoo.com>
 <2619d78-e8f-334a-20c0-2a60c936a293@linux-m68k.org>
 <ca0ded24-9fa0-fae4-89cf-20fc1959f69d@csgroup.eu>
 <c031a1e7-fde7-7c39-d9ff-404157cfc0df@linux-m68k.org>
 <ee724da4-4a5b-65c3-9c1c-d78954fdc7b4@csgroup.eu>
 <73921a8e-6d76-7ae9-1ba2-811966df5179@linux-m68k.org>
 <06ddf5ab-b0c9-1c64-92ea-a9cfbfb9f3b0@yahoo.com>
 <f23ddb5b-90cb-2ba9-f043-66d475311b7@linux-m68k.org>
From: Stan Johnson <userm57@yahoo.com>
Message-ID: <d8e4e491-acb3-4234-813f-e88d52c32bc6@yahoo.com>
Date: Sat, 7 Aug 2021 07:09:41 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f23ddb5b-90cb-2ba9-f043-66d475311b7@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.18796
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
Cc: debian-powerpc@lists.debian.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/6/21 10:08 PM, Finn Thain wrote:
> 
> On Fri, 6 Aug 2021, Stan Johnson wrote:
> 
>> $ egrep '(CONFIG_PPC_KUAP|CONFIG_VMAP_STACK)' .config
>> CONFIG_PPC_KUAP=y
>> CONFIG_PPC_KUAP_DEBUG=y
>> CONFIG_VMAP_STACK=y
>> $ strings vmlinux | fgrep "Linux version"
>> Linux version 5.13.0-pmac-00004-g63e3756d1bd ...
>> $ cp vmlinux ../vmlinux-5.13.0-pmac-00004-g63e3756d1bd-1
>>
>> 1) PB 3400c
>> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-1
>> Boots, no errors logging in at (text) fb console. Logging in via ssh and
>> running "ls -Rail /usr/include" generated errors (and a hung ssh
>> session). Once errors started, they repeated for almost every command.
>> See pb3400c-63e3756d1bdf-1.txt.
>>
>> 2) Wallstreet
>> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-1
>> X login failed, there were errors ("Oops: Kernel access of bad area",
>> "Oops: Exception in kernel mode"). Logging in via SSH, there were no
>> additional errors after running "ls -Rail /usr/include" -- the errors
>> did not escalate as they did on the PB 3400.
>> See Wallstreet-63e3756d1bdf-1.txt.
>>
> ...
>> $ egrep '(CONFIG_PPC_KUAP|CONFIG_VMAP_STACK)' .config
>> CONFIG_PPC_KUAP=y
>> CONFIG_PPC_KUAP_DEBUG=y
>> # CONFIG_VMAP_STACK is not set
>> $ strings vmlinux | fgrep "Linux version"
>> Linux version 5.13.0-pmac-00004-g63e3756d1bd ...
>> $ cp vmlinux ../vmlinux-5.13.0-pmac-00004-g63e3756d1bd-2
>>
>> 3) PB 3400c
>> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-2
>> Filesystem was corrupt from the previous test (probably from all the
>> errors during shutdown). After fixing the filesystem:
>> Boots, no errors logging in at (text) fb console. Logging in via ssh and
>> running "ls -Rail /usr/include" generated a few errors. There didn't
>> seem to be as many errors as in the previous test, there were a few
>> errors during shutdown but the shutdown was otherwise normal.
>> See pb3400c-63e3756d1bdf-2.txt.
>>
>> 4) Wallstreet
>> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-2
>> X login worked, and there were no errors. There were no errors during
>> ssh access.
>> See Wallstreet-63e3756d1bdf-2.txt.
>>
> 
> Thanks for collecting these results, Stan. Do you think that the 
> successful result from test 4) could have been just chance?

No. I repeated Test 4 above two more times on the Wallstreet. After
stomping on it as hard as I could, I didn't see any errors. I ran the
following tests simultaneously, with no errors:

a) Ping flood the Wallstreet
862132 packets transmitted, 862117 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 0.316/0.418/12.163/0.143 ms

b) "ls -Rail /usr" in an ssh window.

c) "find /usr/include -type f -exec sha1sum {} \;" in a second ssh window.

d) With a, b and c running, I logged in at the X console (slow but it
worked). Load average was 7.0 as reported by uptime.

So the success seems to be repeatable (or at least the errors are so
unlikely to happen that I'm not seeing anything).

> 
> It appears that the bug affecting the Powerbook 3400 is unaffected by 
> CONFIG_VMAP_STACK.
> 
> Whereas the bug affecting the Powerbook G3 disappears when 
> CONFIG_VMAP_STACK is disabled (assuming the result from 4 is reliable).
> 
> Either way, these results reiterate that "Oops: Kernel access of bad area, 
> sig: 11" was not entirely resolved by "powerpc/32s: Fix napping restore in 
> data storage interrupt (DSI)".
> 

That sounds right. Thanks for investigating this.
