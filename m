Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1723DCA70
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 08:58:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GcsRs6TJWz3cPy
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 16:58:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=LGbSjiyi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=66.163.189.82;
 helo=sonic306-20.consmr.mail.ne1.yahoo.com; envelope-from=userm57@yahoo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=LGbSjiyi; dkim-atps=neutral
Received: from sonic306-20.consmr.mail.ne1.yahoo.com
 (sonic306-20.consmr.mail.ne1.yahoo.com [66.163.189.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GcsRN41Pkz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Aug 2021 16:58:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1627801097; bh=ojgOvQurpul3Ab40d+287SwWcHzWn5BoEeWRuti067o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To;
 b=LGbSjiyiHx+w+SuDjf6oa/Au24hlv4IsgPflPKj0AOK2GSP3doURZAJOZkS8menuX6/p/dWLD7Fz7jTqB8nXV/F4BkW52B9gzxvJ9M/oTJMDmAwGOo+Yuw1h2diSDXhvKu8e3rUcWxKeBTOLPDdGDTwG6l3c4lmZzseEat7OSp7glyD+FLARK/+wWPXiEJ5vlc8EA1a16Z33k01cgSZC+KgidmbBPHunpQu8dUFMGmCLvOqK1+EqL3Sj8mc273teefaQ+ptJZxrQZh3V3tzkQLxlzEGgy9pneELnrpPiBc3R+K1+cWjGXYXLn6a+TPBFLv3HZYz4UCo3qY3Qm8LU9Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1627801097; bh=9CJxuNZP27kXl7BYDMoBNqDX+HGWPKDU7wQH2swrSIc=;
 h=X-Sonic-MF:Subject:To:From:Date:From:Subject;
 b=CRDhnNmlh72LsLxHOACdt/4QaBCcDYYRbARhDRWZJh4VTM8M8F62FaLTMcHGh+ZiPlvUevHACsn1Bt7wxLx0Wta58cg7b0/4JcjXoWgRWfkX2AUkqNk3YouHjVFaZtg+4WWju2s4Dr88UlBAJvarMcZi/Vy/DnpxTi01uGxF8bvNEXxLlTFumLjSIuyG7/haUB6XhHWEhUDiskWg5eoLgM5nlozj29oRwoGp0QM/us+v4O25rdEv0VdDUqwSMDTaWdaTy2QaQnEsag54OwFmlWEp7DvLyQXw/8eu9W/axC4TcS48eCTzMBlhxJbbfPqiYdfFeICU2Sx8jokPxNxujQ==
X-YMail-OSG: 8wL1_isVM1koNAwgu6CI1rzNDzY7K2KIwwudZ4agttqE0OPYZTjkw9VVzY1JYcs
 0pCnScdHdBK8Ya6Ds1OGjSsRyE522eTpqXbXb7wcT39RA3kyDwStEsHGG5lVgL1LX.XNPHANIcCW
 gtcoFxiEgLh.CKbI.rfAOvLQRdPPbXC7FTSyyN3mstZkfzaNBekZNyMrjVa.L9CKU1F9YrWZIucz
 IkC31R_haLq4ETB2AzBh4pOYGA_KFAWmZjLFTsAbLT66jGFFgBkMp..c.5Ay_BY_mZANOZbt8RPm
 W7PAQCxbqsO0g2r1OHX7.2fb5vjfZf072sC.2kXlaKZILa2NWKWA7qPRrk8E_YntL9KmjosjWizV
 bcPzob.3W.spZowf.QKDwi3pQHT7jKOq4YSU05A0HA0KYAZpAm_P9cBEVSpgBGviDXEvjEtAIDb9
 YoxcQAp_REN5xW5oj2Sn3xDHFJdve7iKM4nUZB_j.tSoI5YM0FIcMr0mvxrTUbbGo_R5sdGyMpQp
 GCQPWASP.Zokgh2nlbvZSb3ykzobBJAFP62Yl9bAZ6CpWV6a2AGMuejBXCos32NWeRLM1O7B4y9P
 MEw_l2pl4kIpD64JDgCv4PHvzRbhnVrUDIoLPpiCnDAb6ENaScPLOjKc4njqLB7dWbgHfJh6Zvpp
 F0xKOf2XgCWNB8Sv8q1JF0_c3GSvUqN0xwNmSqnaKYc.ns.tze1gw9ZdIzCmJc0vvSuvGdE8zswJ
 Sv0VfuuVqqw9k9KkKZKKCRHHrMIhYJOkjgZ6Q4hFsNwfLviZoMwW3ldsj2C3irRrooISr7.21EvW
 i6QtR7KexzWk3FDsKLfXM.4s.5CLdeomjmtGbKwo8UCnLa0SCC8_siggg5E4v8T7kvTDSWQpfslI
 6Uyv0PIfrZEX2t9wbj.jnRYvCXO5bRs6uV1IyzdK2NGPriiY.YrH9EKDniYACVeWUZN4Ij1Qim2L
 02TriIRRSEFMCOD9F9DmBNailHi5qn0UOQAua8riBW7ImPbixQnW.dFJiUDBqXuRfNwKndnS83mk
 umBhI0Zv1iyAAn7.nqUNo0IWO490iXb7vVQ1x3CWDBm7WMyxnSOIXvXvw5YVio1yvSP.JZGH26VH
 Tz7j2PxjdpONDrG3U5hVQCLJfGGr.CZluQTsivjrXkYKHOptm3JnPbZmn.bixms3JDRZ2ezsfpz0
 UoWCLCmIFx_WgYiyOeWY2LXVdhDo6g72PfCsKoJm4hYujm._PQvf8u16U_soUkYSnKdgicHCGGm7
 pod9lZeMzHPr8zGXg1HoXxF55H83D29WSq3zrnB2WjQMeL6Io0G0IXvhc.iW_MegH009P1WIQ_9h
 4z7wLwh7r.m1xFEqEaAsD6KWBy0EoKYxa.PzMJwdQ44D_HeCej5G85VkYyM0t69qvzBCBmgShjEg
 n7OJ4xFHL_VjgzQLaCBd5KVGhHoNh0WVxom8X8CypBZ6xCXiGQy26zEV_UUtMWRT1CWT3mQ_4S1t
 zSrd1RW6K7iiklFgX0Rrfxc2Ui7QRmptbxz2f23EFBcd1LyF3_gVFOOXe.gHMD3nIgUfxeagUwKz
 Q47ZM5uuHRGyxf7m3PhcMkqPfAT8mCER.Cu09bm_70OmB6jUNvNF.sc9e7mRZIGIoXJSdAqGcj9Q
 AFeL1tK4u.jz49SSR7eeZggtUHEsiWWVHhk9x27gzBxCVlu8T27nJpK.36ufLRYNKc8hiDNUITqi
 .PvGRxqOsRNwT4rvQKfS_3gt_GXKtf40nKZ.1wCDP5Bws8V6gun0XjiDGQArwsc10ObSHPrGsYOB
 IAghELmyjgPF_M53zM5oOmO1T8DuxDRIZM5_96hP4zi2QxGPI7HJfzQjm9OeB59QkWVh56VXqWHd
 R7iWM6pnAUkn8iDP_vKPjiqBVz30b9Jjll3_a03lEQwHGyMZYDrOBmHEPhcXaV4aeKOx_SPf0pFS
 7FT0Iyit0miTenZkV2pb0zgAILi1Gu4DMwjGpWGaRuxCt0aevRu3fgIdUGXGZ30wCxNijmyjvehq
 bB70zbVzdVfAo2grWlYgZcFgCu.NOk.YuMy4Xr4Zgc2JVhSccVz54X09JDb_RI0bu6uTGwQIQmFV
 wjMRxq_sn9lCkmmSfG4LmW717anKc_o8hr6nCXf8sBSSWlgjObRC3nenY_AsY0JrxKtd03Fw1vi4
 2uLP3nk0l1bVusxvcCjrlQKd3Wnba6j38XtrfPkDciMswh7R0LhZTAZHIJmzl7mOq4QHYBLikJJ3
 D2F9Aq3KnAo6N3Fhrge_rFkFrGG5vcz1aEh2vZjvYaY0wHB8N.BA59gJjSgwdPjO_PzkZx2akOXa
 u5ldD1uDXiNZ0UQGT_nWoeC.tRh8NBD3UFWYJDvRTyFknY9fvZc4FTYH4GHdftpZBMkawc.xv4vB
 Hsv5dqyLqPrjbLnUvCRDAauDWLBBiHDjlB6hlGphAHu1KsGl3fyPO32v5.uJRs.D.9qPJxwtPC80
 kNDW.zO35liB.XzL5twnyAXFhzIIg3zLJNm3kzl7lCb.YefoSqbTCA.Ydb1aurleEjKmXFb794Aq
 pVYo6D.sYsjKCh3Z_O7FJopZ6rKQwd.XOACg8GB6V7BIYilsejs0XNTCR_p7cs1eHGme.vWKJLAD
 JvYdSTz0BqGzyv9QbAc.Gb2X2MFih4XwAH1sAZomfcNLfS15oPtp80yYKQs8DOreEdMMv2d.1dIx
 g11PMXVHYCAKhVfb6ndyUAU.TP5ti7uhYXmQi6Ka6riHIfXmg8cCH9F_IbhrEw7JAKT_Z3M.PG39
 SDLiT3fpZMbF93Oh7gi4Y6cldppRctNly7GXvQhQyR3VbzH3Jwqmkzz__ezzZjUMdhzpT9O3zNIn
 VoPPukNes9s8h5MV.RS4BT_4Ql1FcA_btBpvbzgccDo4oahyVg3FIlXn3GqAfq2DCntkLnfr5WEF
 kK9qB2PAncmKhCoW4TjU6JQJz3EFhLrCGD6dckoIcypu_1CjKNIUqiDBTb2Rq8.1Ehc.zEm.En6X
 I5is3fZ9cKTL6XMIBGyYq5U5hlfhjM3oQAUWnw0CJ.sq53GWjRQ--
X-Sonic-MF: <userm57@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Sun, 1 Aug 2021 06:58:17 +0000
Received: by kubenode523.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 7d114066698aa0b3f9ef553763ef2c59; 
 Sun, 01 Aug 2021 06:58:14 +0000 (UTC)
Subject: Re: [PATCH v3 31/41] powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
To: Finn Thain <fthain@linux-m68k.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
 <ca5795d04a220586b7037dbbbe6951dfa9e768eb.1615552867.git.christophe.leroy@csgroup.eu>
 <666e3ab4-372-27c2-4621-7cc3933756dd@linux-m68k.org>
 <20210731173954.Horde.fV2Xkw7-sxjG0DUcZ_JO_g3@messagerie.c-s.fr>
 <1d601b7c-1e39-e372-39a5-e1e98e56e2a5@linux-m68k.org>
From: Stan Johnson <userm57@yahoo.com>
Message-ID: <34e52975-4ab9-4eb4-3501-02376e38a27c@yahoo.com>
Date: Sun, 1 Aug 2021 00:57:57 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1d601b7c-1e39-e372-39a5-e1e98e56e2a5@linux-m68k.org>
Content-Type: multipart/mixed; boundary="------------5843AD206033C59C3A67093C"
Content-Language: en-US
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
Cc: linux-kernel@vger.kernel.org, Nick Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------5843AD206033C59C3A67093C
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 7/31/21 7:21 PM, Finn Thain wrote:
> On Sat, 31 Jul 2021, Christophe Leroy wrote:
> 
>>>
>>> Stan Johnson contacted me about a regression in mainline that he 
>>> observed on his G3 Powerbooks. Using 'git bisect' we determined that 
>>> this patch was the cause of the regression, i.e. commit 4c0104a83fc3 
>>> ("powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE").
>>>
>>> When testing 4c0104a83fc and all subsequent builds, various user 
>>> processes were liable to segfault. Here is the console log that Stan 
>>> provided:
>>
>> Hi, i will be able to look at that more in details next week, however I 
>> have a few preliminary qurstions.
>>
>> Can you reliabily reproduce the problem with the said commit, and can 
>> you reliabily run without problem with the parent commit ? 
> 
> Yes and yes. (I already asked Stan to establish those things before I 
> contacted the list.)
> 
>> I'm asking because at first look that commit doesn't bring any 
>> functionnal change.
>>
>> Coukd you provide your .config ?
>>
> 
> Please see attached. My understanding is that all of Stan's builds were 
> performed like this:
> 
> $ cp ../dot-config-powermac-5.13 .config
> $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean olddefconfig vmlinux

Yes, that's right.

> 
>> Could you try without CONFIG_VMAP_STACK
>>
> 
> Stan, would you please test the following build:
> 
> $ git checkout v5.13
> $ cp ../dot-config-powermac-5.13 .config
> $ scripts/config -d CONFIG_VMAP_STACK
> $ make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean olddefconfig vmlinux
> 
Please see the attached serial console log (four boots):
1) v5.13-mac, CONFIG_VMAP_STACK=y, mem=512M (fails)
2) v5.13-mac, CONFIG_VMAP_STACK=y, mem=384M (works)
3) v5.13-mac, CONFIG_VMAP_STACK=n, mem=512M (works)
4) v5.13-mac, CONFIG_VMAP_STACK=n, mem=384M (works)

My apologies if the extra boots were not needed (due to the time
difference, I'm trying to anticipate future requests).

Cutting and pasting Finn's commands above builds a new kernel
(5.13.0-pmac) with the following in .config:

$ fgrep VMAP .config
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y

I'm not sure what "scripts/config -d CONFIG_VMAP_STACK" does, since
"CONFIG_VMAP_STACK=y" is in "../dot-config-powermac-5.13 .config".

1) I booted the resulting kernel on a 512M Wallstreet (WS-1) with its
default memory setting (i.e. not specifying a mem= parameter in BootX);
that boot proceed to a login prompt (serial console and fb console wdm
prompt). There were multiple errors, and the X login screen hung.

2) Repeating 1) but with "mem=384M" passed to the kernel, everything
worked as expected (X worked, no errors logged).

Next, I edited .config and changed "CONFIG_VMAP_STACK=y" to
"CONFIG_VMAP_STACK=n", then I ran:
"make ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu- -j4 clean
olddefconfig vmlinux"

The resulting .config does not set CONFIG_VMAP_STACK:
$ fgrep VMAP .config
CONFIG_HAVE_ARCH_VMAP_STACK=y
# CONFIG_VMAP_STACK is not set

3) Same as 1 (512M) but with CONFIG_VMAP_STACK not set in v5.13.
Everything works (no problems with X, no errors logged).

4) Same as 2 (384M) but with CONFIG_VMAP_STACK not set in v5.13.
Everything works (no problems with X, no errors logged).

Please let me know if you need anything else.

thanks for investigating this problem

-Stan Johnson

--------------5843AD206033C59C3A67093C
Content-Type: application/octet-stream; x-mac-type="0"; x-mac-creator="0";
 name="WS-1_serial_console.txt.xz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="WS-1_serial_console.txt.xz"

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
AAAABFla
--------------5843AD206033C59C3A67093C--
