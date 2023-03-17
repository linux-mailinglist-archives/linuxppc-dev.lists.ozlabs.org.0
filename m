Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 482CB6BEB1F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 15:26:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdRK90pZDz3f72
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 01:26:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=b1irkMk2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=b1irkMk2;
	dkim-atps=neutral
X-Greylist: delayed 326 seconds by postgrey-1.36 at boromir; Sat, 18 Mar 2023 01:26:01 AEDT
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdRJ95Xb6z3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 01:26:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1679063147; i=markus.elfring@web.de;
	bh=SCwrapoV90k7PPQXDoRWVOZ47w9dirURaRogquQ3emo=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=b1irkMk2EyV5IjLVoCRR85PqkzNEepHkRNaJ5mcabkqu78aSA7wUtQVP7J5wmYuC5
	 o3KeXChE6AHUtJrwoJqOmdJ4sP1sN2lvA2qtwHXOBSycggLVZ5d4mOIhygUn4tjTMr
	 6xhfkWkwpugLRFiw2ES7UTtt0YIWnxofec6CxRscR++na8IEDB+X81NREsF5poQztY
	 CoKPdCDjCjz7BcCWmmvewb6s0WaHHOsxpkRDnv1O7r9U/Bz2yUM2NI8+BEQvn6Cnmy
	 CPre1P+dwmW9c/yZmLs82rr843z7zlhL1AOKd+y/dhRK9VjYr1+khjilqmiQ2XRpPi
	 HqRwLg+U+iB+Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MF2gW-1pjjS22i6a-00Fmzu; Fri, 17
 Mar 2023 15:20:14 +0100
Message-ID: <a01643fd-1e4a-1183-2fa6-000465bc81f3@web.de>
Date: Fri, 17 Mar 2023 15:20:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: powerpc/pseries: Fix exception handling in
 pSeries_reconfig_add_node()
Content-Language: en-GB
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kernel-janitors@vger.kernel.org
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <0981dc33-95d0-4a1b-51d9-168907da99e6@web.de> <871qln8quw.fsf@linux.ibm.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <871qln8quw.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CIqQ89eGA+84OKhR0u04OjAu5Q0Bl7u7oC4Tlc8vFMvrrqZUMoi
 OKxoF+lovWdcDuCsiU10l4UWIJo9ZTDwa+FwNcRxwZ+vgwFRNd8yjjjX7otII4+B8f/oKmC
 IoH3lEmVCRAimgsaSCe6egrfLQfOSIqWAPoWIYHbRdBbP/o0K+Z39MxXsJhUHzadOZjKpA5
 5cUVNqWeYbCmSi6/TKzXA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+H5OaRK7vvw=;lS2azn5E0I1bAqHcvUiLw1cSN01
 +LJs87L+NZjUN9vJeo7eZrYqNufe8TrW4yDZkU/lC0KHUkHvA26jIBQMkt+6PfubcmDzc2SgV
 YinCfUBbAWnXOL+0/bMTN3xB8lGiguQ+XwOxGL0MbIdqLtGUQ5ZJCLoRqu0tBsMMUn3gzgBd+
 nPKf3SJEacR16Zgo70nXF/Tk0D2JE3k8S1htzwcxMtbcFzQL1kfsNTrOpLxVvCewDxSSdSxW6
 +ezeLT9uYIqqdskxGfRWGmF+8yc37Qpc7R+wLJ61vu+vdOhA8nksdHAxfVPCm0wvW5puKQwcC
 0+eid+m8R26EdauypIxGd86FyddHT9D/4PJ1YTGLo4L7Yt/j+mg4QrybowpU8tXZKeaAZtsId
 DiNYljPIyU7bl7jEiyg6aDKR4uSy3OLHDCTI2QhfY2Ibb/Dy8wHodz6hOoDZYpAlkLW1YExG1
 PpDggJq/q3DqF1bJzy2/fqjU4iXRKuxM07flVlVKRvBGGHpaiIx08CLMh711Rl+AtAKDsJB18
 torRrz3MZqSJVkNXG9r9EZhe9UFTw1LyiYlldJuzvKySGl6diVlNSp85xZQG7p1Lz0y5xMsVB
 vLx1l7Y6zwOrXj64oqKpP7rTMpl48DsIHuMbmS3p8+LJbGSmDN+G7WOZt6c8E+auHuxg3Tv0o
 tfBzCDZ1IIjIl60UZGYH66ZkQPe+WraL2b1aZX7RrVKD37EAHjfhp9lWbuJBt0Uzfqot7XIkY
 YORbHVT7OdT4z/tMkKDAzlSNzjGLofoK8nsU7HlmrNdEnf+GsHQenHXFtamqMFBCwVuUwKOPF
 0ySsd+We6vEEtiDs8n2IcUPuUKOW1SfgJ8kSTrEDwFDI0DwAX9GyMl5edGQEPMwmEzGpOk+iW
 f+IPL8jIPvJkCJY2jZBuFPcF1Z+makwMXfuHpmSzmA0/QF6S177h1AIlbH3MPr69mXMggQL9L
 HSmDVg==
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
Cc: Paul Moore <paul@paul-moore.com>, LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, cocci@inria.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>> The label =E2=80=9Cout_err=E2=80=9D was used to jump to another pointer=
 check despite of
>> the detail in the implementation of the function =E2=80=9CpSeries_recon=
fig_add_node=E2=80=9D
>> that it was determined already that the corresponding variable containe=
d
>> a null pointer (because of a failed function call in two cases).
>>
>> 1. Thus return directly after a call of the function =E2=80=9Ckzalloc=
=E2=80=9D failed.
>>
>> 2. Use more appropriate labels instead.
>>
>> 3. Delete a redundant check.
>>
>> 4. Omit an explicit initialisation for the local variable =E2=80=9Cerr=
=E2=80=9D.
>>
>> This issue was detected by using the Coccinelle software.
> Is there a correctness or safety issue here?

I got the impression that the application of only a single label like =E2=
=80=9Cout_err=E2=80=9D
resulted in improvable implementation details.


> The subject uses the word "fix" but the commit message doesn't seem to i=
dentify one.

Can you find the proposed adjustments reasonable?


> Can you share how Coccinelle is being invoked and its output?

Please take another look at available information sources.
https://lore.kernel.org/cocci/f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de/
https://sympa.inria.fr/sympa/arc/cocci/2023-03/msg00017.html

Another command example:
Markus_Elfring@Sonne:=E2=80=A6/Projekte/Linux/next-patched> spatch --timeo=
ut 23 -j4 --chunksize 1 -dir . =E2=80=A6/Projekte/Coccinelle/janitor/show_=
jumps_to_pointer_check.cocci > ../show_jumps_to_pointer_check-next-2023031=
5.diff 2> ../show_jumps_to_pointer_check-errors-next-20230315.txt


Regards,
Markus
