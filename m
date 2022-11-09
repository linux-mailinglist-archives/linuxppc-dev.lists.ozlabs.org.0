Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A876622867
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 11:26:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6h2P1YDBz3cP0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 21:26:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NDfex9KT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:2:267::; helo=out0.migadu.com; envelope-from=yajun.deng@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NDfex9KT;
	dkim-atps=neutral
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6h1R0mn0z3cNj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 21:25:13 +1100 (AEDT)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1667989509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UxSAUEU7dUHX8uXVKmhL2XrMALMGpdGOiF9x2+tt7Qc=;
	b=NDfex9KTaksfZLqSPQYR0tYZ46/l+NCCLB1sTX03Y4KQfQL4y1F/EuNilYrvKOvkAncC/9
	W2KDrV/mlbr+Uiq6vV1T+OYB2RzHJqla7JUj4fKGzRGrJULxz0fuCUDZdiHBpUQjP0X56I
	nTklW+kPjLtub0Rtneas3MnvO34RpOA=
Date: Wed, 09 Nov 2022 10:25:09 +0000
Content-Type: multipart/mixed;
 boundary="--=_RainLoop_610_540467935.1667989509"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yajun Deng" <yajun.deng@linux.dev>
Message-ID: <4fee7f2b0e99e256465ef6e7656c6349@linux.dev>
Subject: Re: [6.1.0-rc3-next-20221104] Boot failure - kernel BUG at
 mm/memblock.c:519
To: "Sachin Sant" <sachinp@linux.ibm.com>
In-Reply-To: <e00989c4a69943cb4f60fc7ffaa06f8c@linux.dev>
References: <e00989c4a69943cb4f60fc7ffaa06f8c@linux.dev>
 <Y2oLYB7Tu7J91tVm@linux.ibm.com>
 <E2499567-0D0F-44DA-AC68-1E279009A6DE@linux.ibm.com>
 <58779468e28e026a1aa30a42ca7e8aec@linux.dev>
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, Sachin Sant <sachinp@linux.ibm.com>, Mike Rapoport <rppt@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


----=_RainLoop_610_540467935.1667989509
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

November 9, 2022 6:03 PM, "Yajun Deng" <yajun.deng@linux.dev> wrote:=0A=
=0A> Hey Mike,=0A> =0ASorry, this email should be sent to Sachin but not =
Mike. =0APlease forgive my confusion. So:=0A=0AHey Sachin,=0ACan you help=
 me test the attached file? =0APlease use this new patch instead of the o=
ne in memblock tree.=0A=0A> Can you help me test the attached file? =0A> =
Please use this new patch instead of the one in memblock tree.=0A> =0A> N=
ovember 8, 2022 3:55 PM, "Mike Rapoport" <rppt@linux.ibm.com> wrote:=0A> =
=0A>> Hi Yajun,=0A>> =0A>> On Tue, Nov 08, 2022 at 02:27:53AM +0000, Yaju=
n Deng wrote:=0A>> =0A>>> Hi Sachin,=0A>>> I didn't have a powerpc archit=
ecture machine. I don't know why this happened.=0A>>> =0A>>> Hi Mike,=0A>=
>> Do you have any suggestions?=0A>> =0A>> You can try reproducing the bu=
g qemu or work with Sachin to debug the=0A>> issue.=0A>> =0A>>> I tested =
in tools/testing/memblock, and it was successful.=0A>> =0A>> Memblock tes=
ts provide limited coverage still and they don't deal with all=0A>> possi=
ble cases.=0A>> =0A>> For now I'm dropping this patch from the memblock t=
ree until the issue is=0A>> fixed.=0A>> =0A>>> November 6, 2022 8:07 PM, =
"Sachin Sant" <sachinp@linux.ibm.com> wrote:=0A>>> =0A>>> While booting r=
ecent linux-next on a IBM Power10 Server LPAR=0A>>> following crash is ob=
served:=0A>>> =0A>>> [ 0.000000] numa: Partition configured for 32 NUMA n=
odes.=0A>>> [ 0.000000] ------------[ cut here ]------------=0A>>> [ 0.00=
0000] kernel BUG at mm/memblock.c:519!=0A>>> [ 0.000000] Oops: Exception =
in kernel mode, sig: 5 [#1]=0A>>> [ 0.000000] LE PAGE_SIZE=3D64K MMU=3DRa=
dix SMP NR_CPUS=3D2048 NUMA pSeries=0A>>> [ 0.000000] Modules linked in:=
=0A>>> [ 0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.1.0-rc3-next=
-20221104 #1=0A>>> [ 0.000000] Hardware name: IBM,9080-HEX POWER10 (raw) =
0x800200 0xf000006 of:IBM,FW1030.00=0A>>> (NH1030_026) hv:phyp pSeries=0A=
>>> [ 0.000000] NIP: c0000000004ba240 LR: c0000000004bb240 CTR: c00000000=
04ba210=0A>>> [ 0.000000] REGS: c000000002a8b7b0 TRAP: 0700 Not tainted (=
6.1.0-rc3-next-20221104)=0A>>> [ 0.000000] MSR: 8000000000021033 <SF,ME,I=
R,DR,RI,LE> CR: 24042424 XER: 00000001=0A>>> [ 0.000000] CFAR: c000000000=
4ba290 IRQMASK: 1=0A>>> [ 0.000000] GPR00: c0000000004bb240 c000000002a8b=
a50 c00000000136ee00 c0000010f3ac00a8=0A>>> [ 0.000000] GPR04: 0000000000=
000000 c0000010f3ac0090 00000010f3ac0000 0000000000000d00=0A>>> [ 0.00000=
0] GPR08: 0000000000000001 0000000000000007 0000000000000001 000000000000=
0081=0A>>> [ 0.000000] GPR12: c0000000004ba210 c000000002e10000 000000000=
0000000 000000000000000d=0A>>> [ 0.000000] GPR16: 000000000f6be620 000000=
000f6be8e8 000000000f6be788 000000000f6bed58=0A>>> [ 0.000000] GPR20: 000=
000000f6f6d58 c0000000029a8de8 00000010f3ad8800 0000000000000080=0A>>> [ =
0.000000] GPR24: 00000010f3ad7b00 0000000000000000 0000000000000100 00000=
00000000d00=0A>>> [ 0.000000] GPR28: 00000010f3ad7b00 c0000000029a8de8 c0=
000000029a8e00 0000000000000006=0A>>> [ 0.000000] NIP [c0000000004ba240] =
memblock_merge_regions.isra.12+0x40/0x130=0A>>> [ 0.000000] LR [c00000000=
04bb240] memblock_add_range+0x190/0x300=0A>>> [ 0.000000] Call Trace:=0A>=
>> [ 0.000000] [c000000002a8ba50] [0000000000000100] 0x100 (unreliable)=
=0A>>> [ 0.000000] [c000000002a8ba90] [c0000000004bb240] memblock_add_ran=
ge+0x190/0x300=0A>>> [ 0.000000] [c000000002a8bb10] [c0000000004bb5e0] me=
mblock_reserve+0x70/0xd0=0A>>> [ 0.000000] [c000000002a8bba0] [c000000002=
045234] memblock_alloc_range_nid+0x11c/0x1e8=0A>>> [ 0.000000] [c00000000=
2a8bc60] [c0000000020453a4] memblock_alloc_internal+0xa4/0x110=0A>>> [ 0.=
000000] [c000000002a8bcb0] [c0000000020456cc] memblock_alloc_try_nid+0x94=
/0xcc=0A>>> [ 0.000000] [c000000002a8bd40] [c00000000200b570] alloc_paca_=
data+0x7c/0xcc=0A>>> [ 0.000000] [c000000002a8bdb0] [c00000000200b770] al=
locate_paca+0x8c/0x28c=0A>>> [ 0.000000] [c000000002a8be50] [c00000000200=
a26c] setup_arch+0x1c4/0x4d8=0A>>> [ 0.000000] [c000000002a8bed0] [c00000=
0002004378] start_kernel+0xb4/0xa84=0A>>> [ 0.000000] [c000000002a8bf90] =
[c00000000000da90] start_here_common+0x1c/0x20=0A>>> [ 0.000000] Instruct=
ion dump:=0A>>> [ 0.000000] 7c0802a6 fba1ffe8 fbc1fff0 fbe1fff8 7c7d1b78 =
7c9e2378 3be00000 f8010010=0A>>> [ 0.000000] f821ffc1 e9230000 3969ffff 4=
800000c <0b0a0000> 7d3f4b78 393f0001 7fbf5840=0A>>> [ 0.000000] ---[ end =
trace 0000000000000000 ]---=0A>>> [ 0.000000]=0A>>> [ 0.000000] Kernel pa=
nic - not syncing: Fatal exception=0A>>> [ 0.000000] Rebooting in 180 sec=
onds..=0A>>> =0A>>> This problem was introduced with next-20221101. Git b=
isect points to=0A>>> following patch=0A>>> =0A>>> commit 3f82c9c4ac37708=
2e1230f5299e0ccce07b15e12=0A>>> Date: Tue Oct 25 15:09:43 2022 +0800=0A>>=
> memblock: don't run loop in memblock_add_range() twice=0A>>> =0A>>> Rev=
erting this patch helps boot the kernel to login prompt.=0A>>> =0A>>> Hav=
e attached .config=0A>>> =0A>>> - Sachin=0A>> =0A>> --=0A>> Sincerely you=
rs,=0A>> Mike.

----=_RainLoop_610_540467935.1667989509
Content-Type: application/octet-stream;
 name="0001-memblock-don-t-run-loop-in-memblock_add_range-twice-.patch"
Content-Disposition: attachment;
 filename="0001-memblock-don-t-run-loop-in-memblock_add_range-twice-.patch"
Content-Transfer-Encoding: base64

RnJvbSAwYTQ4OTgwZDczNDZjNTgyZWViNzE5OGQ4MjJkNTZhNGMxOTI2NjMyIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBZYWp1biBEZW5nIDx5YWp1bi5kZW5nQGxpbnV4LmRl
dj4KRGF0ZTogV2VkLCA5IE5vdiAyMDIyIDE3OjM1OjI3ICswODAwClN1YmplY3Q6IFtQQVRD
SCB2M10gbWVtYmxvY2s6IGRvbid0IHJ1biBsb29wIGluIG1lbWJsb2NrX2FkZF9yYW5nZSgp
IHR3aWNlIGluCiBtb3N0IGNhc2UKClRoZXJlIGlzIG5vIG5lZWQgcm91bmQgdHdpY2UgaW4g
bWVtYmxvY2tfYWRkX3JhbmdlKCkgaW4gbW9zdCBjYXNlLgoKV2UgY2FuIGNhbGwgbWVtYmxv
Y2tfZG91YmxlX2FycmF5KCkgdG8gZXh0ZW5kIHRoZSBzaXplIGlmIHR5cGUtPmNudApncmVh
dGVyIG9yIGVxdWFsIHRvIHR5cGUtPm1heCBiZWZvcmUgbWVtYmxvY2tfaW5zZXJ0X3JlZ2lv
bigpOyBvdGhlcndpc2UsCndlIGNhbiBpbnNlcnQgdGhlIG5ldyByZWdpb24gZGlyZWN0bHku
CgpTcGVjaWFsOiBtZW1ibG9ja19kb3VibGVfYXJyYXkoKSB3b3VsZCBuZXN0ZWQgY2FsbCBt
ZW1ibG9ja19hZGRfcmFuZ2UoKQppZiBzbGFiX2lzX2F2YWlsYWJsZSgpIGlzIE5VTEwsIHNv
IHdlIHNob3VsZCByZXBlYXQgYWdhaW4gYmVmb3JlIGluc2VydAppbiB0aGF0IGNhc2UuCgp2
MzoKIC0gRml4IG5lc3RlZCBjYWxsIGluIG1lbWJsb2NrX2RvdWJsZV9hcnJheSgpLgoKdjI6
CiAtIEFkZCBhIGNvbW1lbnQgd2hlbiB0aGUgYWxsb2NhdGlvbiBpcyByZXF1aXJlZC4KClNp
Z25lZC1vZmYtYnk6IFlhanVuIERlbmcgPHlhanVuLmRlbmdAbGludXguZGV2PgotLS0KIG1t
L21lbWJsb2NrLmMgfCA3NiArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCA0MiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9tZW1ibG9jay5jIGIvbW0vbWVtYmxvY2su
YwppbmRleCA1MTFkNDc4M2RjZjEuLjQyZDNlNDE1N2Y0YSAxMDA2NDQKLS0tIGEvbW0vbWVt
YmxvY2suYworKysgYi9tbS9tZW1ibG9jay5jCkBAIC01NzgsMTEgKzU3OCwxMSBAQCBzdGF0
aWMgaW50IF9faW5pdF9tZW1ibG9jayBtZW1ibG9ja19hZGRfcmFuZ2Uoc3RydWN0IG1lbWJs
b2NrX3R5cGUgKnR5cGUsCiAJCQkJcGh5c19hZGRyX3QgYmFzZSwgcGh5c19hZGRyX3Qgc2l6
ZSwKIAkJCQlpbnQgbmlkLCBlbnVtIG1lbWJsb2NrX2ZsYWdzIGZsYWdzKQogewotCWJvb2wg
aW5zZXJ0ID0gZmFsc2U7CiAJcGh5c19hZGRyX3Qgb2Jhc2UgPSBiYXNlOwogCXBoeXNfYWRk
cl90IGVuZCA9IGJhc2UgKyBtZW1ibG9ja19jYXBfc2l6ZShiYXNlLCAmc2l6ZSk7Ci0JaW50
IGlkeCwgbnJfbmV3OworCXVuc2lnbmVkIGxvbmcgb2NudCA9IHR5cGUtPmNudDsKIAlzdHJ1
Y3QgbWVtYmxvY2tfcmVnaW9uICpyZ247CisJaW50IGlkeDsKIAogCWlmICghc2l6ZSkKIAkJ
cmV0dXJuIDA7CkBAIC01OTgsMjQgKzU5OCw4IEBAIHN0YXRpYyBpbnQgX19pbml0X21lbWJs
b2NrIG1lbWJsb2NrX2FkZF9yYW5nZShzdHJ1Y3QgbWVtYmxvY2tfdHlwZSAqdHlwZSwKIAkJ
cmV0dXJuIDA7CiAJfQogCi0JLyoKLQkgKiBUaGUgd29yc3QgY2FzZSBpcyB3aGVuIG5ldyBy
YW5nZSBvdmVybGFwcyBhbGwgZXhpc3RpbmcgcmVnaW9ucywKLQkgKiB0aGVuIHdlJ2xsIG5l
ZWQgdHlwZS0+Y250ICsgMSBlbXB0eSByZWdpb25zIGluIEB0eXBlLiBTbyBpZgotCSAqIHR5
cGUtPmNudCAqIDIgKyAxIGlzIGxlc3MgdGhhbiB0eXBlLT5tYXgsIHdlIGtub3cKLQkgKiB0
aGF0IHRoZXJlIGlzIGVub3VnaCBlbXB0eSByZWdpb25zIGluIEB0eXBlLCBhbmQgd2UgY2Fu
IGluc2VydAotCSAqIHJlZ2lvbnMgZGlyZWN0bHkuCi0JICovCi0JaWYgKHR5cGUtPmNudCAq
IDIgKyAxIDwgdHlwZS0+bWF4KQotCQlpbnNlcnQgPSB0cnVlOwotCiByZXBlYXQ6Ci0JLyoK
LQkgKiBUaGUgZm9sbG93aW5nIGlzIGV4ZWN1dGVkIHR3aWNlLiAgT25jZSB3aXRoICVmYWxz
ZSBAaW5zZXJ0IGFuZAotCSAqIHRoZW4gd2l0aCAldHJ1ZS4gIFRoZSBmaXJzdCBjb3VudHMg
dGhlIG51bWJlciBvZiByZWdpb25zIG5lZWRlZAotCSAqIHRvIGFjY29tbW9kYXRlIHRoZSBu
ZXcgYXJlYS4gIFRoZSBzZWNvbmQgYWN0dWFsbHkgaW5zZXJ0cyB0aGVtLgotCSAqLwogCWJh
c2UgPSBvYmFzZTsKLQlucl9uZXcgPSAwOwogCiAJZm9yX2VhY2hfbWVtYmxvY2tfdHlwZShp
ZHgsIHR5cGUsIHJnbikgewogCQlwaHlzX2FkZHJfdCByYmFzZSA9IHJnbi0+YmFzZTsKQEAg
LTYzNCwxMSArNjE4LDI1IEBAIHN0YXRpYyBpbnQgX19pbml0X21lbWJsb2NrIG1lbWJsb2Nr
X2FkZF9yYW5nZShzdHJ1Y3QgbWVtYmxvY2tfdHlwZSAqdHlwZSwKIAkJCVdBUk5fT04obmlk
ICE9IG1lbWJsb2NrX2dldF9yZWdpb25fbm9kZShyZ24pKTsKICNlbmRpZgogCQkJV0FSTl9P
TihmbGFncyAhPSByZ24tPmZsYWdzKTsKLQkJCW5yX25ldysrOwotCQkJaWYgKGluc2VydCkK
LQkJCQltZW1ibG9ja19pbnNlcnRfcmVnaW9uKHR5cGUsIGlkeCsrLCBiYXNlLAotCQkJCQkJ
ICAgICAgIHJiYXNlIC0gYmFzZSwgbmlkLAotCQkJCQkJICAgICAgIGZsYWdzKTsKKworCQkJ
LyoKKwkJCSAqIGlmIHR5cGUtPmNudCBncmVhdGVyIG9yIGVxdWFsIHRvIHR5cGUtPm1heCwK
KwkJCSAqIHJlc2l6ZSBhcnJheTsgb3RoZXJ3aXNlLCBpbnNlcnQgZGlyZWN0bHkuCisJCQkg
KgorCQkJICogc3BlY2lhbDogdGhlcmUgbWF5IGJlIG5lc3RlZCBjYWxsIHRoaXMgZnVuY3Rp
b24KKwkJCSAqIGluIG1lbWJsb2NrX2RvdWJsZV9hcnJheSgpLCBzbyBpdCBzaG91bGQgcmVw
ZWF0IGluCisJCQkgKiB0aGF0IGNhc2UuCisJCQkgKi8KKwkJCWlmICh0eXBlLT5jbnQgPj0g
dHlwZS0+bWF4KSB7CisJCQkJaWYgKG1lbWJsb2NrX2RvdWJsZV9hcnJheSh0eXBlLCBvYmFz
ZSwgc2l6ZSkpCisJCQkJCXJldHVybiAtRU5PTUVNOworCQkJCWVsc2UgaWYgKCFzbGFiX2lz
X2F2YWlsYWJsZSgpKQorCQkJCQlnb3RvIHJlcGVhdDsKKwkJCX0KKworCQkJbWVtYmxvY2tf
aW5zZXJ0X3JlZ2lvbih0eXBlLCBpZHgrKywgYmFzZSwKKwkJCQkJICAgICAgIHJiYXNlIC0g
YmFzZSwgbmlkLAorCQkJCQkgICAgICAgZmxhZ3MpOwogCQl9CiAJCS8qIGFyZWEgYmVsb3cg
QHJlbmQgaXMgZGVhbHQgd2l0aCwgZm9yZ2V0IGFib3V0IGl0ICovCiAJCWJhc2UgPSBtaW4o
cmVuZCwgZW5kKTsKQEAgLTY0NiwyOSArNjQ0LDIzIEBAIHN0YXRpYyBpbnQgX19pbml0X21l
bWJsb2NrIG1lbWJsb2NrX2FkZF9yYW5nZShzdHJ1Y3QgbWVtYmxvY2tfdHlwZSAqdHlwZSwK
IAogCS8qIGluc2VydCB0aGUgcmVtYWluaW5nIHBvcnRpb24gKi8KIAlpZiAoYmFzZSA8IGVu
ZCkgewotCQlucl9uZXcrKzsKLQkJaWYgKGluc2VydCkKLQkJCW1lbWJsb2NrX2luc2VydF9y
ZWdpb24odHlwZSwgaWR4LCBiYXNlLCBlbmQgLSBiYXNlLAotCQkJCQkgICAgICAgbmlkLCBm
bGFncyk7CisJCWlmICh0eXBlLT5jbnQgPj0gdHlwZS0+bWF4KSB7CisJCQlpZiAobWVtYmxv
Y2tfZG91YmxlX2FycmF5KHR5cGUsIG9iYXNlLCBzaXplKSkKKwkJCQlyZXR1cm4gLUVOT01F
TTsKKwkJCWVsc2UgaWYgKCFzbGFiX2lzX2F2YWlsYWJsZSgpKQorCQkJCWdvdG8gcmVwZWF0
OworCQl9CisKKwkJbWVtYmxvY2tfaW5zZXJ0X3JlZ2lvbih0eXBlLCBpZHgsIGJhc2UsIGVu
ZCAtIGJhc2UsCisJCQkJICAgICAgIG5pZCwgZmxhZ3MpOwogCX0KIAotCWlmICghbnJfbmV3
KQorCWlmIChvY250ID09IHR5cGUtPmNudCkKIAkJcmV0dXJuIDA7CiAKLQkvKgotCSAqIElm
IHRoaXMgd2FzIHRoZSBmaXJzdCByb3VuZCwgcmVzaXplIGFycmF5IGFuZCByZXBlYXQgZm9y
IGFjdHVhbAotCSAqIGluc2VydGlvbnM7IG90aGVyd2lzZSwgbWVyZ2UgYW5kIHJldHVybi4K
LQkgKi8KLQlpZiAoIWluc2VydCkgewotCQl3aGlsZSAodHlwZS0+Y250ICsgbnJfbmV3ID4g
dHlwZS0+bWF4KQotCQkJaWYgKG1lbWJsb2NrX2RvdWJsZV9hcnJheSh0eXBlLCBvYmFzZSwg
c2l6ZSkgPCAwKQotCQkJCXJldHVybiAtRU5PTUVNOwotCQlpbnNlcnQgPSB0cnVlOwotCQln
b3RvIHJlcGVhdDsKLQl9IGVsc2UgewotCQltZW1ibG9ja19tZXJnZV9yZWdpb25zKHR5cGUp
OwotCQlyZXR1cm4gMDsKLQl9CisJbWVtYmxvY2tfbWVyZ2VfcmVnaW9ucyh0eXBlKTsKKwor
CXJldHVybiAwOwogfQogCiAvKioKLS0gCjIuMjUuMQoK

----=_RainLoop_610_540467935.1667989509--
