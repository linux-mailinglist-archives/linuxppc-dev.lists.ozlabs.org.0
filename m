Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E113E364E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 18:27:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ghnmj1RTXz3bWw
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Aug 2021 02:27:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=cYDMeIbi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=66.163.185.31;
 helo=sonic313-56.consmr.mail.ne1.yahoo.com; envelope-from=userm57@yahoo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=cYDMeIbi; dkim-atps=neutral
Received: from sonic313-56.consmr.mail.ne1.yahoo.com
 (sonic313-56.consmr.mail.ne1.yahoo.com [66.163.185.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ghnm76ytcz302j
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Aug 2021 02:26:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1628353585; bh=HVGuiJywJWWAdC8Tm5wWT74YbLJO01XeyBkOiItO9gk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To;
 b=cYDMeIbiZV+wROCepjGcpTxqLFjruGJI2z+RZvUPCrr/j/WoSNyq7e1lbxpcHOEusVlF8TAp/9Abe/mts5qLwrdszgo2TZ63FVF0oaI7U9Nr0huZDKl1iY7snPI7bBOHR2msOvb2Fj67X4vsUEhi1LIi3NS9QNiJVNBFDUt0a1iCNI3mG1+qyLZHGjmKThGqFrS2EMJLGxXZ5MiWGXSKP3vC9KOLMfVF8F/zdzXVI9xOvP5EZwD0BqF+pvjWzXqKHy3TnjLdmYEvDqyOBNRJbAIwQ1RGROTK79Rhozw31AUWuedMKyYF15NuuVTRI937nYxH57lQiZA/29eij3MZdQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1628353585; bh=mPqbgmshd5M3CgBEkQ7o3rMwu1QuWAf9qcK6iai6znU=;
 h=X-Sonic-MF:Subject:To:From:Date:From:Subject;
 b=F00nP7nZNPAnEsriEU/PPKsBKH4YHREJYq4RH2UmjFO2nb1XdZaw2gAt7mCUFFW5C2+AGSlFKpNcbqNZw5AceulMkCoC9HIbHcri0fisf87XrDk+W+m8E65D4ygcVZHYKMt4bv+vQzgV+BXAVb0wNRkT+gBzhPP9hJlM3QcF5/v43txlJIE8UktREHFmHa6dvwXsP5PssBZglFtR6tTIeSHQywyRGQ2SOdxEQzJbfLe7exalclv34+EjsGuxfqBRLDZRfh6faYpo62hv2U1OcxBD88csr+DPWotVkWZEJf5xWCFxSkLESF4qrbIkCqT7pOysRV1ON/0YiyfJaNnPhQ==
X-YMail-OSG: dqykIvwVM1mxnh1E1Mepo9NRuQy9Gy0SHzb8Bqrbn1jJ3JYowkYUDsd377gkg7o
 e3L1bpfibvtOmsjYQQH15mkmKiWmPME0kEz5nLl9RIJyvTibtkJScmxk5Nis2VrvOcc6uOAaumN0
 Lgxyb68hRdXmc9LmKPCxvW9q5qOcbkA1_R5fNMIXs2UNNLM5E.L8FfGaNXfj1Tz5vilGMvE0k_Lc
 BZ6.zs5221s.aLcjilBNs8Frk2NwvTTZ8U5Cza.dsirWw6k87iR.WF1xDCYZRQvtfCAyQrCkiYhw
 Hu8pgKr99sjYMi5U3M5NNxSXGr5f0knMEvLCWU_zcxlGIMKFwyny0Poiss4OAUBrl5rBl2Rfn6w3
 kNZv0Wq2uCvsf.sbfMhuYdK_dGCIsJA.x6GMkAek8y4onXUxoff9tz5YesYa2CutUcjcLzUYiLij
 yYjrQgxChqKiBDGkdZujSNSoubKTr6MFSXB56rsXhiw.HhL2AM2VdkOWIfPHudzSpa1v39f.xQHd
 gjfSTzPHy2fc.UHFU_bEtV8UHwsEBDqXfiylMU1QBZxXKGOewkciExf_M8eufnvKlTPPOxxN048s
 yaEIF3.bpCw2XSe4qQt9uhFtJdis.wvNvJBNYQGO5XEerT6ZgeQVokncGaGLxNTjVgKLxh2AnHXy
 93r.A3XIxXJBfI4b.98O1IUBrUbGBo3QOMaMScUJ.WCEfxJQTSBJOiw3FwhB0kv0t3zFLN3FNjQc
 i9NZuoPfc48w__gzxS0SrtcIk_.K5v3XrFtiIwuvOCFh8umliTUEM6_zWKciEIx83RKMptwMM0Vn
 .Iq7nRSkFYd8u.09iNYFHmlE1yWHts2CMUwcqV3otVxJU6vxIqzl2WIo2cNYsnyVeieTIgl4xW0q
 WeZggGIbLWvaOeTZdvFYkeU17tPXGs8dcl0Fl9bv.uZSxZBtaPArUvQK9nJw4ZC2IKOF89JwgWdz
 Dm0xB.RbRH4SQav6oknt5pN9QuGirHPhi.u6SCfQ50o9tMDqWaU1Aby_Q0yid9wus.c047eCWQ1I
 5lk4WP8QjoE3XFHUv7daL06K6hmbDKRSI0yZWs6.aS55wF4.HEg2Hm.P75_ttoMCanzXjKqLkmsW
 IYVtfaSqI9ftdbfCgQ2pyxuoYVsUbxRSWVTEWm8Ry8nKH6vcFtGRWGQp5M0wB0dORvaNEM1SupL1
 q0qBePsNr2KubCilFyNkNSVXFmfB_oGuTdHArbbo.iHFafD3wM0M7l4WiudWxqJbRGYEPHoKNs_B
 nA4aMQep.KYHz1aovRgBY9OVB2qF2syT8i_OqlJz2Wug3RH_4KS8sdw7vWG38uNCr7Kvn2B3IDS5
 ym7OdEJ0nTO0qoDHjR6Nts4HQG2Meuw3k_mTYTjjPoUhmteZCa3RTSfOPW.JiXeGoeK6CSIlW2ym
 SlCPJbG_HEPnnfUtgVpeFzpzOhQUY52Wnb7LCK84uT7Vuew7C9_mvLtl3IGS4lj4BGXixAxpS3qa
 Ajb_SkK1xrUt7ZuRWQ5KgT0OdfnUMxeKNMK.Z12yFrS_zMnlrA9TNmA7906NxFwQg7aF1h9r66DZ
 MN9A1gJUy26PfcyVZNljOnE0Kflz7KC.SK0QTjURv.VBwzl2pEROBUeiykD9B3Or_35LscV9cvW8
 t0.3Iut8rHa.mTjTvNp.ryvcU7D8h04.Bbf6yp9Bg2GIivucMI2HebI8o0YOirgdtDC9semWQ7nd
 2ZY_9QDPOxrjYxrJ3gQ2H78hypQzrIRatIJrS6cTkN8P9T54AxGsU4.0vGZxClA1ehO48lXix9We
 sr5iKszh7QfS5gQkVIVjUt4kQ_bYIpLOcip2u.1ioPIuyc5PbsQ7ffIJYXZ0TJoB22xcyrV5iu8y
 5J_OimEwg7sr.m7Bk6d4cy4S48HXV4Htf1Nv.yAICkVCMZD2ZDx6yWpVMi7ov0YYJ5Et27q7lfNl
 maxbCfqrcRpk3JdrYed0jJuUpdI0AwZHyfTukqIblVDPgAzU4pZ1pSLj8694xQ9jKbOfNM0PiT4O
 alPOUbvAfNS2KIYIicBqOTOgUsu5D_lv2M2qDXTQTPjiNZWAVH_Ss7BrXeK_Wvbku9VPQqRhUADj
 Ro4iBhBq55jHcFbKtRU.dNWCS0kKebOcXB4Rqiwiff4hfJdBRyUHW2hswEOgsLTW3QAH._5FdkZ9
 ElS0494XQY7MXVm6RRV0O1OcycF7y.aLFS7v4JSb2XLvX7MAggZzJrh6t_E22YUbYyC1500aEok6
 N5KJqwrpXV5peMft4a8ElYUO_vRF54amRYAuDJCokCnqR79vmmT84w6pk_7kc5873DadUFWtTGF4
 H69hL2ra1KOaNoN5AjOupqESPzJ_cSAWTmbqUlIiZqADHMpbtUd8hy3jd7v6Ss6xCicvrlG5mjrF
 .3.v6B0Hh0aPxAIx0odK75QLGzrSyFcXt5L66RUfg5Ygv1m69jzpkDvPdOSk9Lb0olhVAQq916NU
 viiBxhtxYFr0L5pPiP6JifheJtn5xEccdkDwyyqXho3.RTRarwvNfYWEWncykPZm.jW7q7W0.Zzj
 XUmRJz2YkKbeWTtcPEuC0CaoZZJgarlKn1VlWRWCRhIaEgY3xPbC9CuSFSNro6kg7nWVucDQ5BhW
 4.yAqtawr4W32WO4wenfTzn_AKM3AZBiyhhlPw2zLUydROd8yFxC30AfjXmnHlqkLYRK.lLUf10A
 VpANzL4thtpcZwnVciKiYHxtmgYKmDuIfcUHaYJXAZSr.ITP.NM5rDHw3oJyqzLI2ZkUflcuDN3q
 Wxu4xtJWZGCaL
X-Sonic-MF: <userm57@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ne1.yahoo.com with HTTP; Sat, 7 Aug 2021 16:26:25 +0000
Received: by kubenode511.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 3dc9eaa794065035257c94a558e56cf3; 
 Sat, 07 Aug 2021 16:26:20 +0000 (UTC)
Subject: Re: Debian SID kernel doesn't boot on PowerBook 3400c
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Finn Thain <fthain@linux-m68k.org>
References: <60841a75-ed7c-8789-15db-272bf43055f5.ref@yahoo.com>
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
 <d8e4e491-acb3-4234-813f-e88d52c32bc6@yahoo.com>
 <8373276b-ba7a-440b-b353-fdb1be558628@csgroup.eu>
From: Stan Johnson <userm57@yahoo.com>
Message-ID: <47e3180a-be1a-aec1-b5d9-b7d25547b1dc@yahoo.com>
Date: Sat, 7 Aug 2021 10:26:02 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8373276b-ba7a-440b-b353-fdb1be558628@csgroup.eu>
Content-Type: multipart/mixed; boundary="------------5A2DA90EF3439C2A5EB3BD5D"
Content-Language: en-US
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

This is a multi-part message in MIME format.
--------------5A2DA90EF3439C2A5EB3BD5D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 8/7/21 8:35 AM, Christophe Leroy wrote:
> 
> 
> Le 07/08/2021 à 15:09, Stan Johnson a écrit :
>> On 8/6/21 10:08 PM, Finn Thain wrote:
>>>
>>> On Fri, 6 Aug 2021, Stan Johnson wrote:
>>>
>>>> $ egrep '(CONFIG_PPC_KUAP|CONFIG_VMAP_STACK)' .config
>>>> CONFIG_PPC_KUAP=y
>>>> CONFIG_PPC_KUAP_DEBUG=y
>>>> CONFIG_VMAP_STACK=y
>>>> $ strings vmlinux | fgrep "Linux version"
>>>> Linux version 5.13.0-pmac-00004-g63e3756d1bd ...
>>>> $ cp vmlinux ../vmlinux-5.13.0-pmac-00004-g63e3756d1bd-1
>>>>
>>>> 1) PB 3400c
>>>> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-1
>>>> Boots, no errors logging in at (text) fb console. Logging in via ssh
>>>> and
>>>> running "ls -Rail /usr/include" generated errors (and a hung ssh
>>>> session). Once errors started, they repeated for almost every command.
>>>> See pb3400c-63e3756d1bdf-1.txt.
>>>>
>>>> 2) Wallstreet
>>>> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-1
>>>> X login failed, there were errors ("Oops: Kernel access of bad area",
>>>> "Oops: Exception in kernel mode"). Logging in via SSH, there were no
>>>> additional errors after running "ls -Rail /usr/include" -- the errors
>>>> did not escalate as they did on the PB 3400.
>>>> See Wallstreet-63e3756d1bdf-1.txt.
>>>>
>>> ...
>>>> $ egrep '(CONFIG_PPC_KUAP|CONFIG_VMAP_STACK)' .config
>>>> CONFIG_PPC_KUAP=y
>>>> CONFIG_PPC_KUAP_DEBUG=y
>>>> # CONFIG_VMAP_STACK is not set
>>>> $ strings vmlinux | fgrep "Linux version"
>>>> Linux version 5.13.0-pmac-00004-g63e3756d1bd ...
>>>> $ cp vmlinux ../vmlinux-5.13.0-pmac-00004-g63e3756d1bd-2
>>>>
>>>> 3) PB 3400c
>>>> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-2
>>>> Filesystem was corrupt from the previous test (probably from all the
>>>> errors during shutdown). After fixing the filesystem:
>>>> Boots, no errors logging in at (text) fb console. Logging in via ssh
>>>> and
>>>> running "ls -Rail /usr/include" generated a few errors. There didn't
>>>> seem to be as many errors as in the previous test, there were a few
>>>> errors during shutdown but the shutdown was otherwise normal.
>>>> See pb3400c-63e3756d1bdf-2.txt.
>>>>
>>>> 4) Wallstreet
>>>> vmlinux-5.13.0-pmac-00004-g63e3756d1bd-2
>>>> X login worked, and there were no errors. There were no errors during
>>>> ssh access.
>>>> See Wallstreet-63e3756d1bdf-2.txt.
>>>>
>>>
>>> Thanks for collecting these results, Stan. Do you think that the
>>> successful result from test 4) could have been just chance?
>>
>> No. I repeated Test 4 above two more times on the Wallstreet. After
>> stomping on it as hard as I could, I didn't see any errors. I ran the
>> following tests simultaneously, with no errors:
>>
>> a) Ping flood the Wallstreet
>> 862132 packets transmitted, 862117 packets received, 0.0% packet loss
>> round-trip min/avg/max/stddev = 0.316/0.418/12.163/0.143 ms
>>
>> b) "ls -Rail /usr" in an ssh window.
>>
>> c) "find /usr/include -type f -exec sha1sum {} \;" in a second ssh
>> window.
>>
>> d) With a, b and c running, I logged in at the X console (slow but it
>> worked). Load average was 7.0 as reported by uptime.
>>
>> So the success seems to be repeatable (or at least the errors are so
>> unlikely to happen that I'm not seeing anything).
>>
>>>
>>> It appears that the bug affecting the Powerbook 3400 is unaffected by
>>> CONFIG_VMAP_STACK.
>>>
>>> Whereas the bug affecting the Powerbook G3 disappears when
>>> CONFIG_VMAP_STACK is disabled (assuming the result from 4 is reliable).
>>>
>>> Either way, these results reiterate that "Oops: Kernel access of bad
>>> area,
>>> sig: 11" was not entirely resolved by "powerpc/32s: Fix napping
>>> restore in
>>> data storage interrupt (DSI)".
>>>
>>
>> That sounds right. Thanks for investigating this.
>>
> 
> 
> Thanks a lot for your patience and for the tests.
> 
> I'm still having hard time understanding what the problem is.
> 
> Could you try the new change I pushed into the git repo ? It shouldn't
> have any effect, but I prefer to eliminate all possibilities. The
> documentation says that SRR1 upper bit are 0 on DSI and the code relies
> on that. But if the doc is wrong then that can explain the problem. So
> now I'm forcing it to 0 regardless.
> 
> To get the change, you just have to do 'git pull -r' inside the
> directory where you checked out the sources and build.
> 
> Thanks again
> Christophe
> 

Thanks, Christophe.

In the same directory as previous builds:

$ git checkout chleroy-linux/bugtest
HEAD is now at 63e3756d1bdf powerpc/interrupts: Also perform KUAP/KUEP
lock and usertime accounting on NMI
$ git pull -r
You are not currently on a branch.
Please specify which branch you want to rebase against.
...
$ git pull -r chleroy-linux
remote: Enumerating objects: 6, done.
remote: Counting objects: 100% (6/6), done.
remote: Compressing objects: 100% (6/6), done.
remote: Total 6 (delta 0), reused 6 (delta 0), pack-reused 0
Unpacking objects: 100% (6/6), done.
From https://github.com/chleroy/linux
   63e3756d1bdf..9023760b1361  bugtest    -> chleroy-linux/bugtest
Updating 63e3756d1bdf..9023760b1361
Fast-forward
 arch/powerpc/kernel/head_book3s_32.S | 1 +
 1 file changed, 1 insertion(+)
HEAD is up to date.

Hopefully I did that right and ended up at the right spot.

For tests 5 and 6:

$ cp ../dot-config-powermac-5.13 .config
$ scripts/config -e CONFIG_PPC_KUAP -e CONFIG_PPC_KUAP_DEBUG -e
CONFIG_VMAP_STACK
$ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean
olddefconfig vmlinux
$ egrep '(CONFIG_PPC_KUAP|CONFIG_VMAP_STACK)' .config
CONFIG_PPC_KUAP=y
CONFIG_PPC_KUAP_DEBUG=y
CONFIG_VMAP_STACK=y
$ strings vmlinux | grep "Linux version"
Linux version 5.13.0-pmac-00005-g9023760b136 (johnson@ThinkPad)
(powerpc-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0, GNU ld (GNU Binutils for
Debian) 2.31.1) #3 SMP Sat Aug 7 09:29:11 MDT 2021
$ cp vmlinux ../vmlinux-5.13.0-pmac-00005-g9023760b136-1


5) PB 3400c
vmlinux-5.13.0-pmac-00005-g9023760b136-1
Boots, no errors logging in at (text) fb console. Logging in via ssh and
running "ls -Rail /usr/include" generated errors. As before, once errors
started, they seemed to escalate, including errors during "shutdown -r now".
See pb3400c-g9023760b136-1.txt.

6) Wallstreet
vmlinux-5.13.0-pmac-00005-g9023760b136-1
X login failed, and there were errors. Logging in via SSH, there were no
additional errors after running "ls -Rail /usr/include" -- as before,
the errors did not escalate as they did on the PB 3400.
See Wallstreet-g9023760b136-1.txt.

For tests 7 and 8:

$ cp ../dot-config-powermac-5.13 .config
$ scripts/config -e CONFIG_PPC_KUAP -e CONFIG_PPC_KUAP_DEBUG -d
CONFIG_VMAP_STACK
$ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean
olddefconfig vmlinux
$ egrep '(CONFIG_PPC_KUAP|CONFIG_VMAP_STACK)' .config
CONFIG_PPC_KUAP=y
CONFIG_PPC_KUAP_DEBUG=y
# CONFIG_VMAP_STACK is not set
$ strings vmlinux | grep "Linux version"
Linux version 5.13.0-pmac-00005-g9023760b136 (johnson@ThinkPad)
(powerpc-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0, GNU ld (GNU Binutils for
Debian) 2.31.1) #4 SMP Sat Aug 7 09:49:03 MDT 2021
$ cp vmlinux ../vmlinux-5.13.0-pmac-00005-g9023760b136-2


7) PB 3400c
vmlinux-5.13.0-pmac-00005-g9023760b136-2
As before, the filesystem was corrupt from the previous test. After
fixing that, this kernel boots, and there were no errors from logging in
at the (text) fb console. Logging in via ssh and running "ls -Rail
/usr/include" generated errors. There were a few errors logging in at
the serial console and during shutdown, but the shutdown was otherwise
normal.
See pb3400c-g9023760b136-2.txt.

8) Wallstreet
vmlinux-5.13.0-pmac-00005-g9023760b136-2
X login worked, and there were no errors. There were also no errors
during ssh access.
Simultaneous stress test, also no errors:
a) Login at X console.
b) Ping flood the Wallstreet
359695 packets transmitted, 359688 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 0.322/0.428/16.857/0.165 ms
c) "ls -Rail /usr" in an ssh window.
d) "find /usr/include -type f -exec sha1sum {} \;" in a second ssh window.
See Wallstreet-g9023760b136-2.txt.

As far as I could tell, there were no significant changes from the
previous four tests.

-Stan

--------------5A2DA90EF3439C2A5EB3BD5D
Content-Type: application/octet-stream; x-mac-type="0"; x-mac-creator="0";
 name="pb3400c-g9023760b136-1.txt.xz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="pb3400c-g9023760b136-1.txt.xz"

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
WVo=
--------------5A2DA90EF3439C2A5EB3BD5D
Content-Type: application/octet-stream; x-mac-type="0"; x-mac-creator="0";
 name="Wallstreet-g9023760b136-1.txt.xz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Wallstreet-g9023760b136-1.txt.xz"

/Td6WFoAAATm1rRGAgAhARwAAAAQz1jM4JOVIYNdADgciVaMDZBiZAxS3uGqIZvLWhMmbGHy
oU9ollJACsxYXECvACk01czJc2cO1qNkZwLUINnYPoaYhw8hBxMCgSpjAO2LoOi8nkzZBO73
QFk2jIh2pMyILfmNluac0xYQRe++EVPzFSQeLmYK+cVQzhRck+fi6sOARybzG7oLuEo8H3SM
L3TijXUOyBUElCViC8hAdhcoomxfZWisSYD9Jd7ZRhnnke1gkbh/FwM6430IGDSbSYAaMHGr
9T8wU43idqlM+F3xb9D0fstuFcxKVYXyX9J6bho+Nz1FyvSl+lVwuiYX1IHcnIFDJ1wo8Z/g
11nQwXXByKiqNDKjw4GhWX0qSqLi9g05xal4YpvNSTPydix5G588Yrilxik1SY7hIvBjyAPm
Yp/ZrUhfo2oT/1a2YIsh5IbKXaPucm2dOu5vgAUvVOn7iWp81tz/jt1Mr09ZOH/IaHr1gw4L
Nbxf/QCmTfvy5EMTKwYNrRaSIaM8QHx/rvTKW2frnb62z8yjeAaDw6YjxfRxJZxFzhJ10xwX
3u3BZpdTfZ0wyNWFkAiqVs02NeqWGN3V78HalNuaG+0gBs2R5ePS0ksdAHPWuVwLccwO3G/I
vY/mhMePrsmEe6GMghcug+dDt51cavlW5jR7pMd2a16OzBewJmhrxCp55oeYPjvyI53Cp0Q3
6daFtMyY7dGsbTv9oXukHtWRSSHCG5NgIN8DUaStrKkilzMAHP8euomtQqpJ3MVr0m52DNbu
gpskyy/p2HQZRL3bn/RylAib+QJvEGQcgOfvDdiIONLSdNISsjdfXzS3P7MpyaBYh9ZSdYUh
hO/m3zchZo/6xWP83XTpfAX9K4/1S5W7J/47SPOA2xIxcvB/l1+jFZrQCeleoSO1HtVsuM9G
JchbuGAoattgv4fpRerpzY6t3bbb7ePjPrr1ra2M1WSU7PyoRQgxavMW8bzZt0RyjXitf+0d
9Fa5215z9QtCvOgHs7wgijov0f38W3psckJHuF6Sd77VlaZeLu53QbCrKLaTTFzyNrlU3pFe
shF8bypSHTjCncXEi5uEABG+kP0lsa19FTPetbxkE9gECXBz40SehhSkYoIRQYjoAlwG+9RR
h4H1xb2XHcHXysMO1XsLrZ0wPKgFgYXhIGTVJypDq0fu4VH/5UHpct3KEo+kcEzMsCkrz2EC
rJo6deXQVHewt97qouf4AaW84D8EhtoF7xoAlpkBsM5ij4Ycl9uMsLupGuK6QyQJXiwlpByD
g3iHCBBVY1Db4HFVkwulhZWbL5QGisrgi+rOFi4WvJSoe308FBIhoS9EiGkc9bpH0DHExDfH
LGO5Y5YyUf2Liy2C8gsvucS0e5u0REP8j5ahjJ6ibq6ZY+2ANaw98woSFQkae3ucyKrH84XC
+PxdkM00gr4GJ0O9BfC3XfROOA9OFOFROBp+bGGR2UH1oQ9+AVy5xGjOnzQkXbjCTxj7t8He
ADIvO6UHErvJr6udxfD5llgdh9EGmk1jpQ9DhpuAxjQ7wPkxAtjJDg5B3MgwhpBGjiyQmk0L
cmNkn7IHTh2sulLah0m4RMA2GLDRtdh23FDPat/RrZEnyktoBCqMBFpqMiNhWOqxZm3lH+HW
nhabR/P8uYaFklgjQXpT3q3Weh7Q+OMuB3uzj0qKYEnX29bPP+wlMSbpcqcMkGoi5offHa4o
N7QLuhLsG+WHszc4i17PdYZs8DbLFG22NosT7tffBQXF0u9tm6lDH0rwDgPVCXaJ/0fMvdZs
rjazWBeK8uW1aFK9DUbydIOugXq6YnK9e0b1bVzKbTJfYIV2DR2YLYfyuRwF1XrKpP7ALnAX
hGHQdaz7fVFB2+Izp07B9DNqtcF+fszvPnTv7+GmEJVL5R9dXqDHdTrtjkObyD6b2EQi7L0C
wxbWhPXW8M95CG7aS9fdB/dHDE4EEwlEGkmXgkUfE8DINAR6StDJo+2RgdAiSbSLp5nP609l
tByYJilKi1XJcHe/8262lwsI+YRxFGQasdBxp9TALBlKyVu/ZpSReHR4srLLoL1vzHJnsK+b
Fm7l+lmS4o4dk087pjaHHrvgkgVyntglJiWUkY5wclSuGgv7F9Q9KDTpApkiEucq+yaFNeSn
1ODm9t6Tjt+eehoFbwK4EmOHvhTzk51pXy1MZuis5U0VWdDckhKWo40G+ZgexsduY4tn6GXE
SJNhxjFl47Z1a4EjlIY1qGa2Zh7++PHLSEoYD90NWsAPsuClJsiGXofozcsF68ni4SjqtI4H
jK42u5TqCjlH/e3pzL6x15PV6ZpCcyk5XL+c1iNH0s8NQtwlBCqtVvRXx3/HP5SPTBA9ihRG
rPX3C6QgVaLzyQT9gH8zzTzB0bTelziiqiHONDjZ4BNwqIgkJg8N7W0lpFIKRiMfAtdvqORY
Aywh8rE5atZKrK6ZfpaGkh+xJodoDJfPZGiilj2wW1cdXiqeQijIa0YVyIcS/BUvcCe695DT
/LDwUTp+JDVzyXdB/AYG52lvlJHRbsp4c6cH5bsq/LPF0i5Wi5/cxRJiqdN/soPYWCgtnVAB
7vY1kOTazCNONibf0MhN8V6J1Ix63gHFtWHap+Nkk1Gu4e7zqveorNQSMjpX+znmJFbnFHmG
Euo4LIywa7FT7KM5Uze6QSDEb92iFIfosylZ/OCVim4n+T8QxIIceuQl96hw616m4jOBNsVU
94xG+XVeNltTBtfdfYa7sOh9J2I3o28+1o9jFuCfMD4s9beiVIL6Z29kG5SbcfLwtbo4jT/T
leNtLjyjBbRTzNYwxKudP7TtgHxGUAIErPA3B/fjjFvavy48Ko9dIs47wbLdsgttbgZOCyrc
6oRwEwsJvfZGtxaeCEUwOcxEg/CegT9GX/DobvyrLVILnJIpXehrpE1GSTInPJz7nGVAB7mc
c3onphZpDWg/5MTmELDDp8Fy/rGZpcQbtUoRcUN5i0yLzr+6Hn0P3+LnQSTQMM7Ta/Jfk+9e
pe1LeolY71RIqc5gPD5s9lpz2GFMCpboZ/2U0SsyBeSxkgRIppkNE4HChSTEzPvBBFSdF76N
sEKXGzcvxFjayX5hcyOOhtjVdapw1OIf/HoNWcuXRgi+sbaDC7KLp7S5GdN+7yHM3CSukUye
1/BZGsqwbpZeCtZww5rEysQuQDT4LG6/gq2Dh+9f0P2LlHoXQqzhrNDm8ZhqGO3q/2nASRQI
bquy9R3vzG3dVgGBTxXe5+E4p4vTmOZt6wamSgWHJGt1iSTSTk5KvXe5mcfPnYN4mBL3l6nY
swiJVQ4gbW4Kv8W+oSoWUdJrM9STjply6zhHRCWVg3jxsm/L6JY8/0jWqGRfL3q9urDp+Lwh
BwhxgQU2kpt4ZzTxejK7dgptBqGirk82wAtkPwk+WGmB6CpZgLZNWkGmFGfPNhmxcH+KER6C
ohSaE9KJvxOnjAvApUjFLYMasRNpXP/c5zArZuMEaH06SDSvcbBhxmzw/+D4oFgy8QNLx6od
+XqGCZInA2ponUxnJWIgK0vkVjWjHU9S44qJ303fTID7cW2wcug+XxfVYgKGMgXps6NPALqG
7QVxkNUfrdqnH5TAtCs6UiJ1k6HAlI7khQPXiNu0a2NLchrFuvO4F9EiJoWJT8oOzX1yBx2q
GNJ2/s5d5hbiOvD7tjz0iRxRNVDyN+gxaO3MOGrSg5oXoqCGK3JiH5BCvO7P7IAtUDrCSBvX
gSa1MCcaquS/bBqlEZ+yRH543vLuR4EV9NYewyNqMJ5BXkrBv/sZ8evacPQclgFgmQ2pXmav
EGFdL49MhLNwm0xcu+xIBqiIWSx/9iU3ce51gL5HzkRuh9dWg4wjEliHX18ehCzigUm04CRq
TtvfPx+MrMEexiyOeSd5qqWYv751vaoOD6Kv1Ew+O2ZqITYTpp6N2NdBkv/8rGM52mQ+cdmY
/Gb4It+yvfmkgV8XEWX/EfVellaNfzfAoJ9k1ONfGc/2cm8ZCzhtjmts8OzW71PoqCSu0qAN
bF76biEvbYdmQDYe8ptveIhvg2UQYvRSYUFXYxskGQ9O94yHgIHnB99XllsvyDmPhRaXK1JN
r2iYEINx8hu90ZVwxu4aoON2UkpcIvQ59XXyD/kNVeXJDB3/drUa/P4WK75BtILvIYeKdRaK
8+MXMzjmHqXf1/mUvZzGMdmhUO9mMn72LValpCXgog9EKb513b6MG9rQBIOgTJIJ8OQjCyxK
+hTWlKS+iCJzyQNdiKHSi+NgA55ROjZiOeSEe+XarZD2gUul80p50xIBgYyqcjH84Jn2MlmG
+cSVSTZ7bRwpIfV64uZrsxUbahNkfZknPVBkhOBuNTE2vlNC1ieYnF1zI8S2RID9BuX3nq+y
vbLmahyxXUP3BurEiD8tUwwvn3tKYldXP0YAdjNJR+dUvtGTv2GEel9civncrv1FZRf3LGMv
eKA5gYMXRjjPPkO81Yzr8Nwg1ICgA8i4jHg5CfkBteEIsI3ch9NWuOlYT7a8Dk8Awrn2LRAl
yatabUirAp+Eyqv8HRzopyQ2AC9liKQNyERE5BHbakpuiZINB4QwuG/sQvWDLFsvMelLjlY0
Pkhw3LguJA+OdjaFQe5vnbvpCgpJNDaS08ezQ9UxejEux3m1FxbktELmnSTd9AdU0OmKpEG4
mGZpUbyA70Zoy5TRahan6WAfbfAIaXn7fQIzoHyqloIThL+1Gyj9ijvjlxJ6gLI40MMLb7JC
8rRnq5/1/v2TZi407lBgjIHZhkui0rEfHpW00zY3ND8CHrmJATz+ZvcU6lO0lTf4EO7HbETj
/GnFIo9RGxnxx6/yAfdxXF9Nfo7RO94shLNSuixzVsWKhL9Fdc+DQx0fLGLpTikaxh0Fhg3t
3D6EFLYq+QfLaRUQqXVe8fiIKRDDNKWrzTOCiWRjtd76aCVbE/BKTlkSNfUvmaquNAPEYQWD
Cm0/Xutf1osNC71w9hxtBjz7FTLC5jV63Z6OLik7yE4Db/aqCy4RQec5E2mRL8Rf4HSTgIff
WTBmS9kO04WNP1Est0hb6aGski2tiy8UUG8JUFVx0kLzHx4wEg3gyenCmQUhB1+fIAoe8AKR
MSQYaySjkD7ouvoD/gpcBxEYR71BzN982gciqsfAZfRjQ5J632QynsZfz5ck4d73SNsPwsE+
CiXqBPIbBpRYAdquM2ho4wdWE5sQOxcslNJW6COdMeValmnheLiXQ1eidGkt3peHdYNbnOJc
EWXNgzDKxKxrZQ6XPWvv/TQV2XbV8xTIhR+BPlOpb9XaIystpcncEWRyZ7xA8hnCXFpK5d70
S9oxBfYaPZNJ17R44T7mRaQDH0es2PQGQiCo/fNai75V7iWmgmRk5ZhpQYqMSIn06MNTtuj5
EWC17qEXclBWsq6aOKvygqdQFBpzB8jEJ4CL/KSMfZzYOHCB5h0V29SqVzLY/Hv64o+xHMKb
67Iarl0AF7bGU8ZvQf55tKQhAkdmkEISLmFulDSyYm2N8HyYYxrn2cC+VOgOaR94Q1eJTnSe
SP1/+rxuE5z/j8lvEfboayG67XZhvdg/wSiGn4RRZMLXUQnngh1DFsXYWjsm9Yp4Rgd+qZF7
psn+8nnErMDmlEGg81fLwZM5Aapfqnv6fSjzz79X+rTR229jfAESCYNE5JpYdTwfTBkABdf+
mXgYGv4gVQJR1k8EoShc+Xy718yM/8AJeBHVD6LfX+LhG4C4pmJ7FYfl6vT7wM+iO1XnBr2x
Iiaez5gCAqpiM5cbPXg/tB0m/qJhJhgt9Nz0QxNNot+aoctPiFZxITyPygRJ/m5s0APFHWUU
2QoXsZ0KNCF5S+AL73DJHzTeK21RObND9nT1fIXPEZWyAeHZklfvcrft/s/8Ti7yrqvtwQvn
OTIR9hwj2yjk3+Pb4E+yqgrZWhxUd+OJK5T0rCBot5OOwVUrg22CcoMM5n9LSTEuntLOgpp8
aR4xpjbe1FblQPFP78f/YN7NGVbbO62d1ox6TCRi+jyHjNrFoFKUBPx7LdryenoZ4DBU78qi
4ZkMZEqM+zCgdXIkwDtq0i5x2yPnZwzTLqJo+GQfsqUlIfwqMIMTnLLC1+sWa+07wArkPPte
f2DWo0spR75DVx+eav9QzhKrrdmwA6ZUEBApGDCnB9+f1FrgXnGcXjC9IBiztkvQx1bqobzQ
iwCzDerx7SN+m8zlBKDeOYslzIOc/y2iuKmVuu4B6h6Me8RdQsC1XBxOb+tiG174huCShQ2O
tDAZjGzVA9RIQv/7kXex3QInr+CMROOG5n/5sVsnWf1uBlYKrExanwhv2GCrEobgqfiUEYBx
TLGMHX6qR6PCVFJlAm6mikqp55KFaHRd3otpsEAleASy8AnN7T1ntlz/933Lfrurmg2/AI0g
LGR2fTrGwk17dTuc4vbHEf83rMyKbDfanBc+KIS6HxahJcHIxzKtgrRiMtTE7ufBj+QCLkSv
QTE5RKpzMJ/m5LNnAf8VsrevWnql/9u6Q6Zl0tpVz1srpGZ0CHfo/xoIHa+gEwE+dn6F/qA3
jtCsL1KMKCGrmEUNzi0IDvXZyhUhWRhYPt3cFkRJuSkRbhoLpSZ7uIbhAI69dcp4pS/Kzr8B
b4U1BkJ3rq9/3ScycSy8WJElPyRXLsj+p1SXUviFroPovri5CGEi8Naa8oRXnqiY1tUC80LB
lvh2i6khG6sMOumlg+AI18fx6egZ7uAxUy026Z4Bx/xVXf26M15dDTIMIfuaQMYXRF9EcwUV
VNzsUOIGLaenwVpCQl2zGAQQwqfvcu+hyB0uV52xhujXSo7p3MMvuYy/n+M7CA+xgnyHf75K
ykSwvWuSRzOCipmD8NG4mMMJPKn6YqExdQWguv0EtcqAQMIV/7U7g7BoBJ5mwbC2p6zECQ8Y
GlWM99lJP1zi45SR2TWp4pq9viz2AKLNiaWe6UTbP5YMfqSQ/2TMtTwafjhKqrLznJc0vPrI
tMGCCMxtjp7A6v5KjjUwdmXoYj0OPFrZpIcL3psJxUbgK41D9PIoNcwDga9aEXC/UKcHZhvf
dxKLq+7DP9NgpdWBGGZVghdA2T989M0J79hhXqulU0rrtKL9CW3ASHLgerp1ofX0WFjClx3B
djT+DhiXYOOqm4H9tEtdIuYqRPRH6IrnMoQ2FnygkSTSTvxH4WBiYwGNQtpocE9UhB8Q/ZBS
iPGoIArHDwhf7BL6tPWHU9xQpYf8RYiDa4KL/uf3LfjyqP6Z3fYEOsoTAxQlpBfw9ppakLYZ
pWOeqdNNajjHOVX4AGo5tHiqbNBAMMqQ9x2VRUx9gmEALftRtY1A+XLN+8fAULdwlqLUKA5k
4Iw2IpOGQ+bcSBXLIJHgfaRSbj2Z3ItIrqgmq11MdXNwnc3jWAYrDp2+mw5P+q+QE84iJqCN
q82KgAy5NQXFOkwtfDQuVItvoDe4YLuSfAQ+pxfmwLKTo7VONBx+u/JBHqJrfM56IIy9bOvq
VSlZCBFoxB57NykQKVgX/RzMQOI4i8jp3f5TbSwhX2x/EduMjSw6//4O+c0mo9WsudXUcS/Z
Vyg+w/9a676DNhbSkZR9AoH/Y+HwJvq1PL6IxOE2QnY7ut9j6B4u5JIDltAy1kiQTvfnqfrW
y6G3ngoSGuM1S1xSrkz7Ir76LLYZfHGlmFLgePtImqtFZJFoGEzHNHqiqPQwKVWSSeQ8XMm7
ta1xydP2YG/PIFjGoC4YZ6bB8R5Cz2EvKOt6Xo6EMHYS0hAFVoUMFlabvRe5h7HDjcPjxxYQ
DyaO3WEGVLxUtHvyX8ZeC9An/2de16P/4cplZYJadLXrX4MijyroZof7KFaIysJg2qEh7Ivi
tJ6ktoqTeMW4sEszdldp8agCkZjltowbN6MQQJaTxBXnE4rDK5YN6sm2vZCoUa4riW1MrIe2
UkhUITcp7YbJCL+WiZ+EayHkG5q/btHLpgC/i+yo9YJ+xBE/cPSLbfwC9dRZY5jsyrHqkxna
Bg3qToSgdsVB0/bPFTlma5O089Tt86vsEXN6G6O5cxnsLeQ2hk01esymgnXMhYyskvdGcZi9
kJLuCqKhNXJCAELtkSOT+tzaAsjk49DhhNuuVJPXonmKVpn09LyZwmGgVKm0BR0pvO5yAxF3
OIsfHk7DXj+ldeUngxDR7ot1ohSj5Y7GO5zHde1+835Dc1WcCSrZK+hzoBlTy4ShF1XtB/cx
X2yomEmSwDS9Vq5clC1nW/wGxU+1pozckTbzQMr2nZ6nk+y/G2NFVTAH0UbF4775JDx8eTeC
H/YSxpV2OsbtKrvOllYm187kLPp5fURhwx2CLfOZAmgW4+DScRKrYnd/Y+cJHD6+cBaS4zQC
e/eMN72kv3XQy/g1GpsO68X6CxSmX5mVECNshQu5Nxn2HQwS1lJHr6UAczULfnsTU/w841rB
tgXrqr4/Q4ry6H02lcr1ISRXjMGJbrCz7o55Tr5jQhap2v7L2f6YasT3piWfLyuN0X6Fg1GQ
KpGMyO77CynPG4Agkalp2vuUKLmU3EInQiidDvVKOo4LVLXlvxrrKzSORLzh+eAaVIOxqEBJ
o4CokK+pYmv1c+JnI6NdhPRDsORKhe/+5GZk5ZpoYuy1+Bu3bVl/fFHvARv6k25T81IFmoaO
kCrHa8WsBvqCRm7ZBa8wsASWkrgoq/s5b5fRelt1JVxYZHuvsXBwl5NECplVBiT9QQKU5E03
mEcL8llLD4UWxaJTf85evntKHsSFpy9GfLrEMoYEhmK98KAUIyFBUayMXO138atcLRZquwol
BmVAHcHkvxroEGPkunmqbKZPpXnkKNOmzk8rRJpjKJWmnfzoJrGj99w3v+wUnZX8pmya+wD3
ejIniC/CRe7X32foWk9bRObORSKcBnvdtcK8wBxEtm2ZILIu8R0N4Wx50O15L7WUGs/KGGw8
retYeF6Wyef9/bWKcLNKYMn+z6MtQNgJBvRPnPSf1HRvpSfL10RnP+zpKformo2MJOfAx2SC
xtQNa8p8GeJZxeKV0XU6J9DDQCd9OTcLM1/7yxCrwaZtWmPd8il96zw1Qjrx+1wDQTeKhecp
BEPwGyg84AhiFDRwsiyHIDvy0a0tRE4DgRRVSLPa4pLmk8G30V2aYfdFXkaX8gx9jC0acsce
wU27kgnkGMcEKSwJd5hPjsMx6m9l/BCrx3qrNXm22zKI7aKRkt6V2pprchQ+xfTnJc9LMTlo
iKgGvtByqamRUb3tP/oipr5nPbfPlMdNgb/kM3zqqlUHRu6Td9B0b/H4Eujb/L0/ecEMkq33
O+sHqWA8L8rPIc6ZAEJ2pK4XnHZiAdXtBPsNXbx34T37mdby2AYdud9UHmMpuFWNNskc8Qrn
CMKl49jVhzxCNGvuCFIMFJSMYbfj8hC5TPvaIAbjiSwCZ1ISXrX1cP6K5Kym8Bn/rmDFEQio
Wao909/VzdobjqtEMX5JwzsW3IsWKcTGLforARpPBixqpTPZ22A8JWcChW5hs00OkEnzWjhH
g8JZe2zWt5pqRV5a5TPLHJti91ZRUSVkUh9pIQiZ6bZNhiOmikozNik2HQZgDqbee/HlHWzw
a0a7SqfpdqOyrI5Q7vHdFp2NncfPeNqKmC7Z0olV4qI1t/E+jcwxnunIOQHoJ4JsMlU07rgc
8Cb94JukSYiF0KFEgQt75D59aTrVP0WkT5+RAN8ofmP4MH6KSj5COqRviCTxyYyLWdZA5nFS
yBXz/mgKWIPj4tTtztFSwJUamNU6dQbWBzLre8VYgYOqvpIPNrf9UMljquD/99uLfKYDb0vD
mcSB+i6PcCK9HYuKroK4SjZQZbJShnefrl/rC9XFO25fvtl/BDQPtNQP4UakGm6ZZSoI4VbD
+UxyrfQ5/6W+b2iMYpyzdy6Y8ChzWuAdz9nVgPcqVaY1gF2wWnYoKW9vkZfYCI9A3t5KqMEr
Mes+nCZyK5lYJ8Xw37SzSxTe2hpH3XEEPCYhqkFll9fGNu9JrRfuYQb7LtY+q04oCbyCvmv2
saPqA9VvHO3Q0buw+vCdUpPCs7QnuBu3tH3pSbg5yg4ZKduc3CeZqOlnKaRg26XAm5RfGyWI
pPg8JTqgcaTfbceD0Mkf9MJ7+oYCyIvzB4CEgGneH0l5Xhn5GSykI5Zj7Ftopq57hjCzxvzg
RodIiI5A7/JbmlLu9fT/3bCgA9NXtOrB6iHEYQUGxwsCO04D+C8w+i3geZYu0EP50SFnGju4
1rXfk+XFGHt1lGYf/BwXFT/v1MR14MN76WL+3MrCJSPvWAoFaVx4Ky4vpcXmW0pGecLTwfGM
kQmw156WHd29+H1hPRLb5DE4Swd0MSQ9cgHcVhs33aby5OkW68bN1ogOcKOOLG6dOegdt+Df
fj4hb49x1DSA8jo4p2hydwav/6k2C12wD20+Iph1nf+t+DoHLzMEKAc6lE6Fhfy15n7Aygyv
7rJB4LENDBJD/wdrII1W6IsFrQae3/1xVRBBmhtXGRwb0mea8p4SnXm2vPZIHBdurF8ot1XY
8EQ6B7mtfcDmLM0uLfQ78GkSsp27kUSGYCE8xAcbtjhRMHa7QFROjn++8+gmI2KT5T6cdtaO
JFqjxTrolRdJojgQ8QVV8/Kb9K72KmQtVYKByIvPwnoidAF+IBPyij+zDZt8P65LAIOc0fdx
0L0/7hgjJ5CQFRr0G64O1EvYP0OSbMLBwdWUvTo1SfxlAW9yqtoKR9/oLPlh+Q/279HVlKJl
AXF7hEhpPIBo8SIsDbVdIBuaBlGIvKFfdhFUpvnOAXxJ5t02le1GcTKcjiuPB0KRC+W+NxHQ
wlBjE9oXcafZ3wRaUJ5H/B/MwxAcT2Qe0qfyH+kOES7UBUcYdH+qOs29nFgbr+/V3fRaM3pz
X9pfM/n33XNZVKpPCvBqSE0eyHjI1fEYGT8bjgb+j9L1RJ05Zniql44PrWv8vAWLjJiU2z7b
6kTI88bsgORgaGLIye50habk/xj+Do1Rg0RDJgkMV0+jX4OlCQiukJ9f2CHRfjCzMHVeIL7S
06S6sHlPgUAO/shiyAvF+BtICj4RlfRr3uLjlYHl8mTUtp/B1p9LP7LhqytuAwZqJOyi6gwv
8m47LAi1oHwrLvxoWRJ7JPmmuWVLU6IEl0uScomrF/u3bqGMb11zf3Qw5uaUrDgtXOv1lKOz
WLvH3hutcT7ginVjeg+Iwkk4kLBjlHR19do5UXcN3yEt8EInEMh3SK+gyjjTn1y3ZWAdnS6u
McFHSLqCfNNj1CEJarwX1nBeqMQsyaVaYpwxAwUfKPFacMyBrUC/T/lbXKKDidyjyZXIVHoD
57/z4DcL//yvHSriPfhN6VFVMslpbDSOLz9yIgpVCf7llgJE20PvpENnDITydCniqWUXic0x
3ahYXA93VfrhwL+IYxrra8Lq5+6CMplW9vzsX9Nk/vfKIl+Ss1dA/q0FvxezgUsBVDnuLS/b
3F0dMCyvnncWMnVaCsiCei9/TgmsF2OiAADj+XkccuqkTQABn0OWpwIAzcUcRrHEZ/sCAAAA
AARZWg==
--------------5A2DA90EF3439C2A5EB3BD5D
Content-Type: application/octet-stream; x-mac-type="0"; x-mac-creator="0";
 name="pb3400c-g9023760b136-2.txt.xz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="pb3400c-g9023760b136-2.txt.xz"

/Td6WFoAAATm1rRGAgAhARwAAAAQz1jM4G6SGtxdADgciVaMDZBiZAxS3uGqIZvLWhMmbGHy
oU9ollJACsxYXECvACk01czJc2cO1qNkZwLUINnYPoaYhw8hBxMCgSpjAO2LoOi8nkzZBO73
QFk2jIh2pMyILfmNluac0xYQRe++EVPzFSQeLmYK+cVQzhRck+fi6sOARybzG7oLuEo8H3SM
L3TijXUOyBUElCViC8hAdhcoomxfZWisSYD9Jd7ZRhnnke1gkbh/FwM6430IGDSbSYAaMHGr
9T8wU43idqlM+F3xb9D0fstuFcxKVYXyX9J6bho+Nz1FyvSl+lVwuiYX1IHcnIFDJ1wo8Z/g
11nQwXXByKiqNDKjw4GhWX0qSqLi9g05P6CgNDA9Q3Fx+tmO2ItEYTi/QRRQBvofy/i11TW9
rVS4Pboe81cMJvLe3wE6fQeV+M0BW2l/IK7UmIFWNhHP2/VQ0Qi8aGn3Nls69fnisk7FkvnD
DCd4MwRZctlL8/e2EGUZ83Ziilc7hSpHPe5T87XjvPE+K1c+ehxLCo34+ki+Igmz38eyXpw2
mumS56x6Zq6uKbZdcxiHK516Q35TiKYUaBpN5OhNdlOIraGDXRAZs8icP9U7LBtuDnMq3t9b
O03f8suf6Ng3zq22h3lSi3dmTxgNPOQBoAkK62HHE9mYQDKsKPcZZx/HeVf+EfxwPOFnUMxG
tjRXkkqchUzdia1lyTes0zLyHDl0Molk/VdRnGsUEbRl6VL4QxhSXQMUBknhNJUZ8r5y1xfM
vn6ixr2YgUfjSrIFWdXM6TjMYuCT4nNmLBw5cycyrd64Ltxf6yQD52Uh2vg6SsYHEwB1wrkC
r8VfY5G0hlJXmR9D/vt1Mup8YphzF0Xsq2SZWck6BVb/ahedLMY8aHvEkNwgWvfrfa8bxX1T
JTUsUu83WO7LmmYWuse/1RDh0VGM0XkJXplXgGOvFzvdzwTMeazGmVUwfXlUdMeUV39Pwb2C
VUpynLfl1TH3X4B7nZLmWIwZiTU1XUk1awDmsZ9RYmj9yVlsSczdEWU/uByD4Iy2Cr1QiCNn
x4n1YFOY3iA44F6Jra9Q27gUQGmqU2snhYi/cETFHB8QQf6WxWB5Mcs/9l/cEi1Wt3TwjUpw
9gbRg8LIC4Q/G8hZ2L9rcjcgV8bQapXp6ngmpv1hNOQKE+7XyFjxH7huIPPx7BXKqVpgMfGZ
E6pny8jdq4Oa9USU0tjGIhawOURU9YDOicClfOGKQDjaGWF1feUVP4hP4P6k1IwjMlyvDWHK
5PYFdi9CCBmDwziKNZZNkhf9uRz1+UTIRuSn7sWUfmO+8dLbVOIhqkvEfPHqBYr04tcdXNPV
E0OiwOA8Z5mzSrWom8N87J6vApMcc20oRZ0tJjWp2gPDJ9jKPa6Nd62ZBLQLrxwX8zxZUbDC
4THcVjPIQZQMSzfzcetyWMHqUfckIS9L8u/hdAyD2KKwk3hFHmW246m3PoGQvFmi8lj/6bnp
LwIPtA5jtQxObu1sFVMJvb+Kqf8uohBAztS6/ZfcoOne1XKG7Mpy0SOaww6UW5nVTCvdD5cS
8hrujm2QFgvHmTfjfvvFfUrHFIK92gASNLn6RnJiYwD89w+YNUAmc5K4Q9YYJansi0Q3ax4O
OxIQSmuV0FrR+XlsFWRtgPn5LRJIO6SiVGtRfmgmwVNLlYLha3MoI56orhHNpg8+vSaAsfL9
6H9uZfnBPhMn3akz0Ylcbm6a0sfZna7lCkSLowkcunZ2ip0O9Y+H5W09xNMmoGzsjYd5Q8dh
V/BepjS+W5YYCKVieKz1DgTyTXGwaVHVoBvWIUu6aApywR1hcVaDTyiu1CkjeTzcJhlQ4spD
GMgmbeo3PDgyWFBHfwtbT7hgD6wNUpJycf3ddioX3b5K8CvfrE/cwFb4rr/G2y/6eoHsryLW
2hT1XTf5tE6cQ6UJiM/Vrl0dZZ07p8WMjVL0Oazh4iSlVg5bMnDqKCqQe18kHd/PnlIj57Mk
77092MCTpjfIVpNG9P3pQ+0ukVObXxhnG0+CHK6M2CVs627q2Ny495+85j13q7xRCjvvjM6i
ZT4eSOy4nEo5eFgUGfYfZIRXzUGx7MxG6ms8M9Rkye5slUnOEcIhWoSCahK9EAJkrLl8Fzfq
GZROILbYTamKLMzFKAJ02Af3Tg8b7Yocfqs6arXThOJGK4JZe1OpCFrKe0ttZ/Ti5EEbYVqL
tKZEvzFQm4Sccm/O6mBt26oVBSPIrE8aZRKj0KF874nZQoZJStsV6/cOQ2fHmVXU6Y6tr425
n9NL8uWVdpd0cGpIMGeZBZwt+/Nhe0b4m2wXfi4q7BMVTSTH/1DFxFi2PTlQiddM0Jx5E3qW
g4kPcrFOeL9oR5JPpwt+KJ8jsOXAnmmirS2dK+KvzIo55SO342qzE0md7PoH282GydyykmNr
/S9d0BH7r7gIxjOQH777duNvobEUCga5szhmkgDkJceP/iHGqq4w6rWgIme2F3Vg8VgAJPmh
zTPbPJhBRHGQpLP+EgdK4WQPeprq5xHQsniQX9Iul6vGhbJCZUbF4k8AYCOQoanGrbV81SPO
Ty4DyAiTzFinzHk+jOBOGZe64rVkgVErMxqVmB00DHIWMKx64++ZJPTkRFE55OI2Y8KR6Erw
OX5WCC3Lx3IL5C3sLsAtcucbMx+eYrVHj6+Y5PfOY4HG/OtWFPzHuomHAsKR426pXav8JivM
/2QbF4nD+Ngr8ZGFC06G/I1KZ4psjsWS8pRZNiiFWcd8p2RoDk4lcrXirTACkcwSpgHDt7lB
sn0Vw3y5ChsQ38R91FAAi31bJjgO+KHmgCUqAbTjVy4oJ22NXH6Sk39qi0PMShmyRgqgciJ3
PF3YM3VsYzemJ8YhnqQQTVhKBTzk0qRDq2T89nsyr40IqXhByvonxmotgyA05tgZcZWz6jDU
JIJtxew8t4VE9qJezw91HlF7mh+R0vqiVopQGaiGg6ekEt0//fEVCwYL7jIjUgFrQxfc7575
v06d5sAv76Xs4igomOOeO8niH6qz80y/uZNkbwPfVC73pZgdDxPEgUA1ogtHJO1dUrJJkyn9
6mwBii1DVMD3AkqvNpvFKb6zd88rj+s2890DdeZWFAfuwK5xzwpckhfPKcJyv5lDMZelVL7T
o7fRThEIqMAVsNE96iOC5mo3DflzST9sUZh9NmFcQ9sF6sIEye2YgUsa77uUhMfPhPd7YX7K
2mcUQ6dxrjIh301DgNWKFhqsTIsM/qzLeAF16jAaU18K6AqPJe941hiKd8/VpV5peupCnMP9
PtE3J3xHVe/ljvw4hHI3EGX3Z1WDjLsY4rQfLw4nmbKz0NjwKu6mJGr2jlp9Vt4dT+YnHDiq
NTKDxCb3lB4XQZkgjPNessFfIgYnC/qomMc3zA2yHtMzLsZiuWhiiT1Rl2lsQynypsj0lmZR
FJi3V+FCkmOhrpk3y+hjXkxiEb+Jv6siGeF3MfMsCv8vpFIfZPQwAo7gKRYu96v1rUySATRb
liEuOJ70jUZCJMPAOytr1JIQzMg8lGZq36TGO8HvMojaa06DNh+RVkhO7HWk8XVyDpH4xWYK
HO1Q768ASABJFmnO04784mh5XIxSANk7i73k2UyU4lQa7E9PDOA+lQvhCR/hNPqBEXVsN346
B7xRn2I+WZs8OAkabhfLQ1u3DbYiTUBBLZ1fste2KpDRYN85u5j27ptUAshMfKSWCTv48Y8s
Jio/5U/OdvkMnYpXnEMsx5QUonR0ZK9T16cDoGnb9rzrX6a0XpSNRz1hiO7qZVeFNF8SVzV2
bY7RyTurSGDPxZahOX4KM2Wg53MlDmQD0hkssVY7tNupOeTY94GhIs5TvlLJ1tzuuB1Ff8/E
fP4sehQFp/k2I5KVnDHMsKO6ZZBTiCK/Jnx3CUDJTm9eCZQ5XbXUIdcMvSLrO4nzL9cBj0Pb
qOZX/IkYT3OUpiC0ykVmnQwU7jT5lZ1HPCvlK4z8psnQTm7maWb2TIUKkP7uFyEL6sBWvjxR
5KBxaSkRxG7d60qycJ3lzJ+ShXrpwTioAXS8gFgH2VG+9dmItYotLVuIp+paMBaA9RPwI0Vt
ObvmwlN84oKAgMCJK8pBU3l2EGCeHo38zUNnhrTlpHCoOsvna8edyviPhVHr0Uq5rV34Zbv5
kgo4wQWA81KtuJF1FxTPeLvQoc+oSlGKtvGg6YSGshbBoSoG+OUT0/8+uzJqoIHeF9oV7SDd
Jtjk05Pikb+WIMN5jkmFbu6t8OkvdbFPeAiRy0S0lOI0QLviQ+8oBWmX7b3vDk9fZhAnFGmB
LnXF/xTlhDaJHGAI4UkuDf1LYC1+ygbm3CNtSARMzg4GJ3BLO3ZH83DTJR5rd11K+iI6ghwB
vUeY+OJt3PxAtfrDmIjtnoSTvzLw3YFZ+QIdqB6+XI92Hi/nUlwdzUho70AUv8AoHEdU3z1o
G3TwT81yOYVjqt2ZVcsFJrd39mYNwAc3BfYjjpUOAalQ9hQCI7jqAWwh2h3r0hWEQLZ79t0m
zBzp4mleU284hwKUPN2xuR+pB2UT9LssmVrRcAqVFq6lUK1Sr/89nWFZPk4xogMUPwUSRLUa
InmgGVYaR3iFbxMlVutHl0UOSBPHJJkzTYBqhv26NEmyz0aR9ce6ayZeW7PZLFWokpUUYk9/
kzC471ZevJ3NXVndzI7cdsoo9EVrA41S7/C6iSDxiUr6jBraQfo1yw1mCs6F5q9V9sBKDEkI
OOvGPfRgzJaJjJkqLBIBoci7DUjV47HROxxZBK8em+rrWJTd9z0bOlsvGTIFKa5xD7o37qx8
KtGdgPWFDLY/6lsiEJD2QbNW41iz9T1MQLVQflwKOOAWY6LYSEWrC8sqMf1hCpN+pJMigUt+
v3pp4QoKzB7f98P5FZUlWyt2PAcbdun2d08Yd7lFXqXhvAHWWlyzVpHDhVAVSC97XOsI22jY
OzBtTbvki1HFHMq1EDuXGW6cEbSjDnQ33MXbp+/wF4CJl+m/wyHSrdansvLjn+bAIH5JH/dY
PfUTp20JYX1yBVogAKjercHts4rVm25jOqenuD37+6Z0LokLd6uGkjmPNBMQJbDLD1IbhwiE
CwulrPSzaP05Ts1mDt8HXiqJY+Fcx3RfOxMbSaCDHg/JOPonmdcI7i7/Xhs47TcZ0FxFcoRj
Qvi3IDtdL7JgDzLIXdwDOtIOIhwCXa7TkVUNIvR3VGO3s2o39bSH9244hwEM/QiykbMJkq6m
bg4LqXnhPlBhRAF7YCSZxQ94wPlWWGU0MjnbTIGzAfCNhRQbKmO153l1rqERc86ekHX2hieO
wcUbKrgtc3gGToMgJxSb6iLKXjC95SW83E9/dEAnJYfL/s/RLpI5jg3FChkmbzT3cB8elOya
p1iib3ckWgYbe4SyGJguYfrdFEZhBkwwgpPW6vPqOLMJ67BHtkh577jgbqBA4am9S72rBwIP
87qRS6a+yUt23bVBSJD5w2+UjggxSHsV9VpBuET0B91sWvcYh1cyaCNrbQbLmDlPg04ZoJET
gtpHTtYNUlvbs1m2J36a/u9Qd+mMR+Az5Yjtk9O0mhFwEyIvPDwZ3R0UZeY5ZYyP0gvWDAHO
gi5d1wYMRb2VFcmNHGrtClCxsK+XESxXzJs1/q+tZAblVlNEuPKZThJnDqimQ44Y1TO5BNxm
ndTC26/u7kCaYtYC9ZtslxU52bNBEZTb1PtObrpY/4Dee8S0JID3IjtqOiPe1Lk3uybgmXg3
gr7gLpeUgrQHcnkzsjHlBzsOoMXZIOamdYZsGXKHeyVu4SyMmT3F/y0A4+iEe0otNbn6EfK4
7OueYSmNuiclcU8PUvKv3eztSUgUoeL8c4s6xgOpYGn0cZ8tqw7XuGwDrnXnnbRRGpun/R+V
TsocYPbCi9EQtqvjonAf0I47DUuFA8gmHmdqnGOltWcq8iry64IkHOuHMtjAxrr7v7MEdbf9
GipqCT7Vz2CBn7JhILvnwFw6nKN04y3vooo5z3WlrR7lWuj9xfyiKpNX0p6h+3CfOYwhRSzC
/2gQyYeWcHhbJrAdR/k3nXxRENV+iTS7rW1GcMm0CLcjTvKy+Ns/hthmDohnWov9ZyuSdGY+
JUukcjfQBr+Qp4j9FHiM0DUdz8tlEPNsRfAHsnlGvFFRW6YsKnFxkn813uotHO7ubym4DiLH
87IR0QfGcH4yCPhYfP1A5yM+X0QTpuAZx4rWZStWV0z4p5DFzzlygKOVWvQk2SI8rT5gpKdT
NDOtoSxdiLR5x3pGZbtrHzA7v2siFYVyfUw4yYhUye1Lqnva7+R8rxGm12Nh7+tb0ThK7wvV
fqXSSQ9KxC+igwGej3lKiKhzF75V0FYCSPB5dar2y26GnLrwvlr8WXU69oeWln2/KdBwZD30
RIUvp35yiASpNYQoSf0DQ7bSGKPbeZZLi7xRdoRDX7lFcmfi/jcwND/0JO3nlIFY0zX+Au/y
eddq00SGmGHFyaf6QIlw779IGFuRpEL5llYhCzToaIymhSKfdNajvrtPNwgiEZjPIZuS/e7M
35jNRU1uRX7pPCXfRmgQpjTzMnVD5lZZg+zDHsRmL1MTjIbBAKVKKKlWFbawncuIqmELjZjF
JyYS8FecZmuNWLWaWCT+my550mcrAZ+YgA4rK+1HwqLf9DKDSOkjqWwn3kxI7QCdJ4QJNdV/
jU8vP1ZIkQW/J/fjJgn+NXAGgje6YHo+f3+Gc8wMTdCHWlxkFLc14DAxnrjBRsKgzAiAeOYV
LeO8fsC34Q+DYRpPRXvNjNxuS4+9gDTXfcgGLlQOh10ubbChy8nbquinqTxBs0WWo2D+En5b
LLYAIg5KKmnHnaW29RxoObSUdvObgCgjZxBmjS7P7fzjCOWRE/wF/uy+mSsISIVbkAJOrH5t
JnCKxh6YrL5uCutJtOEnvMG5mNblbF3QK+fgordYwhIJalOTH87n9laiZvTubZsNIfENi2O+
a4SG4ONBa8LOGrOH5+Gsnflr/O4NepxIp+CtEBBR1sQEAyT/xkMHMb7YLkSS2jW1Bic48EoJ
LCNHJSs9eERubDDjFaNbfbLGjpEJLMOMx0/8fDRP1pG7qCYoRGFsGaTSHyKsythMp8GNtrVb
7SaMtQC3PK1UWfm8+dt4eEQvbvSOaDZx1xrCqItnG32zQjKg6We90BT3KNXahKnQgwGGPxDz
HyIlhTcoPDCyHL4ByUfterzyioMQu7c9qWDXgeXgW51uPqguAXS/isNpal51od197p2N/n0g
wZyX/KDER1ukbSeX8NmpxDy0gUhG/IIZdxkc1hzs+MR9R5TVRPecp5CCAHeg29sAREBwndag
VeNKxyDkCxhQG+lu/Jdr9Eh7RQd9D8WpcBGoKmpNIItjNi9hL+YuJJPSBoaN+Oy3asb9XmZv
SJ1yDulCZ/4oJEKuEeybHYwqBXO937huHlvIxEo9Yn8kSme9Hw3QtnYOF6iMX0hTyfgrFo5g
p9MfEHlrOxMkgeC5AMLlR2Nvo3Cx9uKoBipnsyWMzkzNlGIkrIYIeBRisRnE9mheFPjX5t2f
iMJa3G61TscWZsI5rX3AO7VEgFKGdze2SMfwouqfDPw4BNMDLHBX4FZYVulXKY+mIxmANNdk
UXLmR0XNJMWvy4BVI3oVSqglvTJiGzYItTdeOTKUzVpqR5r6aghZuNsRyolksZevRFruJaUD
xVSe9emoa5JL3sagcbDCVlEDeKeUuuoPNQONDRPUockhmCSHQBk0Z09uzkU6mcno/9pqE2eh
CfQZG3XGgyD226bDdEMkueGXXe0ivdzMO7pcG5kB4uWW3mSZQszndaRAi8gfffc66UU1iFjW
pFgJe0FWeEvRa4L65FPFL9Z/gggtLEnwC6BkhaLWa6B1jKj12RgFIuHVbBQzORXQgT0562f5
7P2pw0s97ihpUPCCwfoNNrkTpQ9YtxNxzpFsBoQ1Lt+Hh4rNyc4cpX2k/pcMSPQTT0cknJRp
2stdCRumzRiqxOEdQ/xHTFB2xwaHc/X4jxZvDclBP0z0ClbDQBdxhK1R2Ez1K7ne42Kb/NUU
YzIMDvca3evEXwyM9lzGyf6kc0Kk4/yDhlZExcwY/zoRSeMujU84wH8k0k9Dpv8ky8tl90jO
zcBsBpE/aWY3BS1PSoJL7lga1ettRMt+OTNnTzpt4hP2zZ14qgU7m1EHmeU4TOPYCmpB/fEb
p2uRuQPz/q3deEIlVgcdJ5olbaV3eVBTs4Ue6UTrClB1nq9ACeWvxV68kmgZU6kISvh4Sd7Q
XX+wwyPznOLloY5I0WtCzY0wUD1m0bh2V6jgWcSqHnid3CuqECTMhd9ZhkkZ15EUolZxf3eZ
SW6C+gkYMcjrVr0uhz9P0eCKXZ8eycOzb7MFcJ/OCQ5UfPs53Y0yRVdGBvy1PcWK75P5UjXL
rnvrqAM8s6roLUl+68YO0RrsjTEljTC7eRJ92bJvhopaDa/uyIw1GZ6RqAcFJkvMZ62thagI
AXqhdAStQT6FpuGbE9H4dSYXpRAv+maB2VEtWMP7zcN4RsABM2kXfPx75upnU6UPsAK/GMtF
rNhsyxPn8jwZlUtb+lm1wIDhzjT07G1Cq/J5EADBdhsGlF2lLw5fQ/h4nSuIGjCfqVP4PYPX
t0gh3dJnTNjgKqHzdJIHaPHL+em7luyH2Tu8mP4JoXBlTFnp8vRnv25XPKHuab/TuTsulsEr
Zpj5k2/Ywv8WHW86CNEq6xsDPwx641wfBT0y5HB07dhiBNgTGgFOfyBowL9tigCGw4XW79oc
uObxVhEd7WPN1BFxUOc4zq5RWs32Y872AWUigV1VJmSeynaszsOHpBPh0SSxHzYuR5tpG25M
cLxcPPmsE9DaGPSKo6dKaYyQWI5U7WvBfN3gx4hYeRLiZOAAUVGPZLbIckvq3/yHbkRNaemu
/Q/AVs6WLnJ9Zgb/qEEdxsdTFaM374vkSskyEdOCiyrPxjdNfd3tQC7G/MIk12SUaMrC1qrO
4rzwK9vejSxrcSYA/pMztxg/vQXrgf3V4jFXvlWwkin1hfLVqULez4lkBwFWlR9o5VzbTW/W
OTJr6O3BcRBvbzdjq/Sl1XoSzjClv+LD5HLgqpRYJQAiWuvsCp9/2MqPsZlJQY9KWz4ac/rV
wwKWN+FcXR6u+OvM7LJGUwdsm7zAsOcflJ8EVozKCj/Mm6IQNPZUDPjIihLCiEBT+gBZfxW1
X7IjhAAB+DWT3QEAN6HqYLHEZ/sCAAAAAARZWg==
--------------5A2DA90EF3439C2A5EB3BD5D
Content-Type: application/octet-stream; x-mac-type="0"; x-mac-creator="0";
 name="Wallstreet-g9023760b136-2.txt.xz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Wallstreet-g9023760b136-2.txt.xz"

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
AAATa2GuscRn+wIAAAAABFla
--------------5A2DA90EF3439C2A5EB3BD5D--
