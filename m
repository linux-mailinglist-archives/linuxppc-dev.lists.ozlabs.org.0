Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E791A5E89
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Apr 2020 14:25:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490WD52GX3zDqKj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Apr 2020 22:25:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.34.219; helo=4.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 4.mo173.mail-out.ovh.net (4.mo173.mail-out.ovh.net
 [46.105.34.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490W601Bf4zDqKj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Apr 2020 22:19:50 +1000 (AEST)
Received: from player687.ha.ovh.net (unknown [10.108.42.88])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id E1B0C137FCA
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Apr 2020 14:03:15 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id 9CC5A114BACC1;
 Sun, 12 Apr 2020 12:03:01 +0000 (UTC)
Subject: Re: Boot flakiness with QEMU 3.1.0 and Clang built kernels
To: Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>
References: <20200410205932.GA880@ubuntu-s3-xlarge-x86>
 <1586564375.zt8lm9finh.astroid@bobo.none>
 <20200411005354.GA24145@ubuntu-s3-xlarge-x86>
 <1586597161.xyshvdbjo6.astroid@bobo.none>
 <1586612535.6kk4az03np.astroid@bobo.none>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d405d8be-93a5-e68c-9ebe-ef42b0f5e87a@kaod.org>
Date: Sun, 12 Apr 2020 14:03:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1586612535.6kk4az03np.astroid@bobo.none>
Content-Type: multipart/mixed; boundary="------------B729630F00F9E16D7736EACA"
Content-Language: en-US
X-Ovh-Tracer-Id: 252764531685428071
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrvdejgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgesmhdtreertdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheikeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: Michael Neuling <mikey@neuling.org>, qemu-devel@nongnu.org,
 clang-built-linux@googlegroups.com, qemu-ppc@nongnu.org,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------B729630F00F9E16D7736EACA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 4/11/20 3:57 PM, Nicholas Piggin wrote:
> Nicholas Piggin's on April 11, 2020 7:32 pm:
>> Nathan Chancellor's on April 11, 2020 10:53 am:
>>> The tt.config values are needed to reproduce but I did not verify that
>>> ONLY tt.config was needed. Other than that, no, we are just building
>>> either pseries_defconfig or powernv_defconfig with those configs and
>>> letting it boot up with a simple initramfs, which prints the version
>>> string then shuts the machine down.
>>>
>>> Let me know if you need any more information, cheers!
>>
>> Okay I can reproduce it. Sometimes it eventually recovers after a long
>> pause, and some keyboard input often helps it along. So that seems like 
>> it might be a lost interrupt.
>>
>> POWER8 vs POWER9 might just be a timing thing if P9 is still hanging
>> sometimes. I wasn't able to reproduce it with defconfig+tt.config, I
>> needed your other config with various other debug options.
>>
>> Thanks for the very good report. I'll let you know what I find.
> 
> It looks like a qemu bug. Booting with '-d int' shows the decrementer 
> simply stops firing at the point of the hang, even though MSR[EE]=1 and 
> the DEC register is wrapping. Linux appears to be doing the right thing 
> as far as I can tell (not losing interrupts).
> 
> This qemu patch fixes the boot hang for me. I don't know that qemu 
> really has the right idea of "context synchronizing" as defined in the
> powerpc architecture -- mtmsrd L=1 is not context synchronizing but that
> does not mean it can avoid looking at exceptions until the next such
> event. It looks like the decrementer exception goes high but the
> execution of mtmsrd L=1 is ignoring it.
> 
> Prior to the Linux patch 3282a3da25b you bisected to, interrupt replay
> code would return with an 'rfi' instruction as part of interrupt return,
> which probably helped to get things moving along a bit. However it would
> not be foolproof, and Cedric did say he encountered some mysterious
> lockups under load with qemu powernv before that patch was merged, so
> maybe it's the same issue?

Nope :/ but this is a fix for an important problem reported by Anton in 
November. Attached is the test case.  

Thanks,

C. 


 

--------------B729630F00F9E16D7736EACA
Content-Type: text/plain; charset=UTF-8;
 name="test.S"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="test.S"

LyoKCk1pa2V5IGFuZCBJIG5vdGljZWQgdGhhdCB0aGUgZGVjcmVtZW50ZXIgaXNuJ3QgZmly
aW5nIHdoZW4KaXQgc2hvdWxkLiBJZiBhIGRlY3JlbWVudGVyIGlzIHBlbmRpbmcgYW5kIGFu
IG10bXNyZChNU1JfRUUpIGlzCmV4ZWN1dGVkIHRoZW4gd2Ugc2hvdWxkIHRha2UgdGhlIGRl
Y3JlbWVudGVyIGV4Y2VwdGlvbi4gRnJvbSB0aGUgUFBDIEFTOgoKICBJZiBNU1IgRUUgPSAw
IGFuZCBhbiBFeHRlcm5hbCwgRGVjcmVtZW50ZXIsIG9yIFBlci0KICBmb3JtYW5jZSBNb25p
dG9yIGV4Y2VwdGlvbiBpcyBwZW5kaW5nLCBleGVjdXRpbmcKICBhbiBtdG1zcmQgaW5zdHJ1
Y3Rpb24gdGhhdCBzZXRzIE1TUiBFRSB0byAxIHdpbGwKICBjYXVzZSB0aGUgaW50ZXJydXB0
IHRvIG9jY3VyIGJlZm9yZSB0aGUgbmV4dCBpbnN0cnVjLQogIHRpb24gaXMgZXhlY3V0ZWQs
IGlmIG5vIGhpZ2hlciBwcmlvcml0eSBleGNlcHRpb24KICBleGlzdHMKCkEgdGVzdCBjYXNl
IGlzIGJlbG93LiByMzEgaXMgaW5jcmVtZW50ZWQgZm9yIGV2ZXJ5IGRlY3JlbWVudGVyCmV4
Y2VwdGlvbi4KCnBvd2VycGM2NGxlLWxpbnV4LWdjYyAtYyB0ZXN0LlMKcG93ZXJwYzY0bGUt
bGludXgtbGQgLVR0ZXh0PTB4MCAtbyB0ZXN0LmVsZiB0ZXN0Lm8KcG93ZXJwYzY0bGUtbGlu
dXgtb2JqY29weSAtTyBiaW5hcnkgdGVzdC5lbGYgdGVzdC5iaW4KCnFlbXUtc3lzdGVtLXBw
YzY0IC1NIHBvd2VybnYgLWNwdSBQT1dFUjkgLW5vZ3JhcGhpYyAtYmlvcyB0ZXN0LmJpbgoK
ImluZm8gcmVnaXN0ZXJzIiBzaG93cyBpdCBsb29waW5nIGluIHRoZSBsb3dlciBsb29wLCBp
ZSB0aGUKZGVjcmVtZW50ZXIgZXhjZXB0aW9uIHdhcyBuZXZlciB0YWtlbi4KCnIzMSBuZXZl
ciBtb3Zlcy4gSWYgSSBidWlsZCB3aXRoOgoKcG93ZXJwYzY0bGUtbGludXgtZ2NjIC1ERklY
X0JST0tFTiAtYyB0ZXN0LlMKCkkgc2VlIHIzMSBtb3ZlLgoKKi8KCiNpbmNsdWRlIDxwcGMt
YXNtLmg+CgovKiBMb2FkIGFuIGltbWVkaWF0ZSA2NC1iaXQgdmFsdWUgaW50byBhIHJlZ2lz
dGVyICovCiNkZWZpbmUgTE9BRF9JTU02NChyLCBlKQkJCVwKCWxpcwlyLChlKUBoaWdoZXN0
OwkJCVwKCW9yaQlyLHIsKGUpQGhpZ2hlcjsJCQlcCglybGRpY3IJcixyLCAzMiwgMzE7CQkJ
XAoJb3JpcwlyLHIsIChlKUBoOwkJCVwKCW9yaQlyLHIsIChlKUBsOwoKI2RlZmluZSBGSVhV
UF9FTkRJQU4JCQkJCQkgICBcCgl0ZGkgICAwLDAsMHg0ODsJICAvKiBSZXZlcnNlIGVuZGlh
biBvZiBiIC4gKyA4CQkqLyBcCgliICAgICAxOTFmOwkgIC8qIFNraXAgdHJhbXBvbGluZSBp
ZiBlbmRpYW4gaXMgZ29vZAkqLyBcCgkubG9uZyAweGE2MDA2MDdkOyAvKiBtZm1zciByMTEJ
CQkJKi8gXAoJLmxvbmcgMHgwMTAwNmI2OTsgLyogeG9yaSByMTEscjExLDEJCQkqLyBcCgku
bG9uZyAweDA1MDA5ZjQyOyAvKiBiY2wgMjAsMzEsJCs0CQkJKi8gXAoJLmxvbmcgMHhhNjAy
NDg3ZDsgLyogbWZsciByMTAJCQkJKi8gXAoJLmxvbmcgMHgxNDAwNGEzOTsgLyogYWRkaSBy
MTAscjEwLDIwCQkJKi8gXAoJLmxvbmcgMHhhNjRiNWE3ZDsgLyogbXRoc3JyMCByMTAJCQkq
LyBcCgkubG9uZyAweGE2NGI3YjdkOyAvKiBtdGhzcnIxIHIxMQkJCSovIFwKCS5sb25nIDB4
MjQwMjAwNGM7IC8qIGhyZmlkCQkJCSovIFwKMTkxOgoKCS49IDB4MAouZ2xvYmwgX3N0YXJ0
Cl9zdGFydDoKCWIJMWYKCgkuPSAweDEwCglGSVhVUF9FTkRJQU4KCWIJMWYKCgkuPSAweDEw
MAoxOgoJRklYVVBfRU5ESUFOCgliCV9faW5pdGlhbGl6ZQoKI2RlZmluZSBFWENFUFRJT04o
bnIpCQlcCgkuPSBucgkJCTtcCgliCS4KCgkvKiBNb3JlIGV4Y2VwdGlvbiBzdHVicyAqLwoJ
RVhDRVBUSU9OKDB4MzAwKQoJRVhDRVBUSU9OKDB4MzgwKQoJRVhDRVBUSU9OKDB4NDAwKQoJ
RVhDRVBUSU9OKDB4NDgwKQoJRVhDRVBUSU9OKDB4NTAwKQoJRVhDRVBUSU9OKDB4NjAwKQoJ
RVhDRVBUSU9OKDB4NzAwKQoJRVhDRVBUSU9OKDB4ODAwKQoKCS49IDB4OTAwCglMT0FEX0lN
TTY0KHIwLCAweDEwMDAwMDApCgltdGRlYwlyMAoJYWRkaQlyMzEscjMxLDEKCXJmaWQKCglF
WENFUFRJT04oMHg5ODApCglFWENFUFRJT04oMHhhMDApCglFWENFUFRJT04oMHhiMDApCglF
WENFUFRJT04oMHhjMDApCglFWENFUFRJT04oMHhkMDApCglFWENFUFRJT04oMHhlMDApCglF
WENFUFRJT04oMHhlMjApCglFWENFUFRJT04oMHhlNDApCglFWENFUFRJT04oMHhlNjApCglF
WENFUFRJT04oMHhlODApCglFWENFUFRJT04oMHhmMDApCglFWENFUFRJT04oMHhmMjApCglF
WENFUFRJT04oMHhmNDApCglFWENFUFRJT04oMHhmNjApCglFWENFUFRJT04oMHhmODApCglF
WENFUFRJT04oMHgxMDAwKQoJRVhDRVBUSU9OKDB4MTEwMCkKCUVYQ0VQVElPTigweDEyMDAp
CglFWENFUFRJT04oMHgxMzAwKQoJRVhDRVBUSU9OKDB4MTQwMCkKCUVYQ0VQVElPTigweDE1
MDApCglFWENFUFRJT04oMHgxNjAwKQoKX19pbml0aWFsaXplOgoJLyogU0YsIEhWLCBFRSwg
UkksIExFICovCglMT0FEX0lNTTY0KHIwLCAweDkwMDAwMDAwMDAwMDgwMDMpCgltdG1zcmQJ
cjAKCQoJLyogSElEMDogSElMRSAqLwoJTE9BRF9JTU02NChyMCwgMHg4MDAwMDAwMDAwMDAw
MDApCgltdHNwcgkweDNmMCxyMAoKCUxPQURfSU1NNjQocjAsIDB4MTAwMDAwMCkKCW10ZGVj
IHIwCgoxOglMT0FEX0lNTTY0KHIzMCwweDgwMDApCgltdG1zcmQJcjMwLDEKCgkvKiBXZSBz
aG91bGQgdGFrZSB0aGUgZGVjcmVtZW50ZXIgaGVyZSAqLwojaWZkZWYgRklYX0JST0tFTgoJ
TE9BRF9JTU02NChyMjksMHgxMDAwMDAwMDApCgltdGN0cglyMjkKMjoJYmRuegkyYgojZW5k
aWYKCglsaQlyMzAsMHgwCgltdG1zcmQJcjMwLDEKCWIJMWIK
--------------B729630F00F9E16D7736EACA--
