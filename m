Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2418FA66A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 01:25:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HpEOxFII;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtVFl1t3wz3d94
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 09:25:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HpEOxFII;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtVDz74nfz3d8K
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 09:24:51 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2eaa80cb4d3so40234581fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jun 2024 16:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717457081; x=1718061881; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uI9O5jaQ0kfa653hSR6g4hwsO4WQYRAKjh78vr8MtSY=;
        b=HpEOxFIIds2IbEyCrge99cO64X1PIjsA9JD64BnxdfdwVQLYtbGjPlLkY08TNnxxi8
         uy7x035L3mfnr6kuHKp+k8czHPGyWM2gXTOoZVkibU1FsfT/3DpA1C0wYSNUhXG57M8A
         OrFt08N/CLduaM0VuZb+N9X518ejoZb3DfksC0eEgGTYVqHTPD7ozoUzQUdGAFAeDR+f
         pb08WTh+5wtQaWh7kwRsYur4IjE2h6FEFjgyRziHJNDBupDgsIASm7ZiQ+M64YqL32dZ
         D6q4ijRyG6QdWNDfuz3NMhDOL1rVc07j7G3VNfiexgBxmXJe1amxDQieWmYZkqDZTKay
         Wlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717457081; x=1718061881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uI9O5jaQ0kfa653hSR6g4hwsO4WQYRAKjh78vr8MtSY=;
        b=Gt0lnYP2pkn3NY9fiCdNTzKaX4yiSDK8CmZKuvRU/MZhlx2kmySGalfChz+xaMVln/
         sslmbbhVCR8RuNsjbz+IqoY1nKYDcAFSe8NkpJpTYHj0b7F7P87hZGqmdHH35l4biEvA
         oa3Q5exUicGgtmf2swR8dKvTCbfQ8+vrnISg9E9PUm3gk2ffeJoFK+IHMM4cw1ykuDyn
         mtE/MMhqFDEsuWbjndIxSgdpI7RDkjk4U1pewykapSDJIEozXEoD8qAnhNQCbP75Ze5C
         4mJRE7JcjOLntlvvznd9fCQt2ddwwsQor9F1g08RsAc9jCfNQ6gmSqMVikbwkmTo1mTS
         F36A==
X-Forwarded-Encrypted: i=1; AJvYcCXNlLaX8ziyj5AOIao4mI3ZcyXsKfMqViD6IC4ajlTm8ag29DgFu3TYhC7f53bMpbowaaJCQHgHrR4oAsK96RBCRT5kA+THOA3xm/HXeQ==
X-Gm-Message-State: AOJu0YwcSk1QiP0/CTf9yK0SJOwCTDZ6XA50dRQrtryByqyYhsB7/xlL
	NGg2JOAzw5a81be2Yr6mJXelq2wcTR1JjAm1Jo8YAp2kNSUuaYIBlJ+89VeeCKvX1DRKxicYPgC
	3KX77dtS6jau1sPW8JqCtpdAtfEgHijMt9dqc
X-Google-Smtp-Source: AGHT+IEUNuM7g9YhDLjaOVQ6ME5e+H6g213LZO/+a9W4oW0WyCXsRz0fuPpEZFPzvaRVcCL1qlZJdtZGuETggOjtRqc=
X-Received: by 2002:a2e:9d88:0:b0:2e1:9c57:195a with SMTP id
 38308e7fff4ca-2ea951de27fmr86665761fa.32.1717457080443; Mon, 03 Jun 2024
 16:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
In-Reply-To: <20240604001304.5420284f@yea>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Mon, 3 Jun 2024 16:24:02 -0700
Message-ID: <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Erhard Furtner <erhard_f@mailbox.org>
Content-Type: multipart/mixed; boundary="00000000000033ca02061a04a3f5"
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Yu Zhao <yuzhao@google.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000033ca02061a04a3f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 3:13=E2=80=AFPM Erhard Furtner <erhard_f@mailbox.org=
> wrote:
>
> On Sun, 2 Jun 2024 20:03:32 +0200
> Erhard Furtner <erhard_f@mailbox.org> wrote:
>
> > On Sat, 1 Jun 2024 00:01:48 -0600
> > Yu Zhao <yuzhao@google.com> wrote:
> >
> > > The OOM kills on both kernel versions seem to be reasonable to me.
> > >
> > > Your system has 2GB memory and it uses zswap with zsmalloc (which is
> > > good since it can allocate from the highmem zone) and zstd/lzo (which
> > > doesn't matter much). Somehow -- I couldn't figure out why -- it
> > > splits the 2GB into a 0.25GB DMA zone and a 1.75GB highmem zone:
> > >
> > > [    0.000000] Zone ranges:
> > > [    0.000000]   DMA      [mem 0x0000000000000000-0x000000002fffffff]
> > > [    0.000000]   Normal   empty
> > > [    0.000000]   HighMem  [mem 0x0000000030000000-0x000000007fffffff]
> > >
> > > The kernel can't allocate from the highmem zone -- only userspace and
> > > zsmalloc can. OOM kills were due to the low memory conditions in the
> > > DMA zone where the kernel itself failed to allocate from.
> > >
> > > Do you know a kernel version that doesn't have OOM kills while runnin=
g
> > > the same workload? If so, could you send that .config to me? If not,
> > > could you try disabling CONFIG_HIGHMEM? (It might not help but I'm ou=
t
> > > of ideas at the moment.)
>
> Ok, the bisect I did actually revealed something meaningful:
>
>  # git bisect good
> b8cf32dc6e8c75b712cbf638e0fd210101c22f17 is the first bad commit
> commit b8cf32dc6e8c75b712cbf638e0fd210101c22f17
> Author: Yosry Ahmed <yosryahmed@google.com>
> Date:   Tue Jun 20 19:46:44 2023 +0000
>
>     mm: zswap: multiple zpools support

Thanks for bisecting. Taking a look at the thread, it seems like you
have a very limited area of memory to allocate kernel memory from. One
possible reason why that commit can cause an issue is because we will
have multiple instances of the zsmalloc slab caches 'zspage' and
'zs_handle', which may contribute to fragmentation in slab memory.

Do you have /proc/slabinfo from a good and a bad run by any chance?

Also, could you check if the attached patch helps? It makes sure that
even when we use multiple zsmalloc zpools, we will use a single slab
cache of each type.

--00000000000033ca02061a04a3f5
Content-Type: application/octet-stream; 
	name="0001-mm-zsmalloc-share-slab-caches-for-all-zsmalloc-zpool.patch"
Content-Disposition: attachment; 
	filename="0001-mm-zsmalloc-share-slab-caches-for-all-zsmalloc-zpool.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lwzlkqoq0>
X-Attachment-Id: f_lwzlkqoq0

RnJvbSAxYWMwZmEzNDc4M2Y2NmVhNzMzNGZkMmU5MTI5YmMzNjJiZWU1MWRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZb3NyeSBBaG1lZCA8eW9zcnlhaG1lZEBnb29nbGUuY29tPgpE
YXRlOiBTYXQsIDEzIE1heSAyMDIzIDAxOjEwOjM0ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gbW06
IHpzbWFsbG9jOiBzaGFyZSBzbGFiIGNhY2hlcyBmb3IgYWxsIHpzbWFsbG9jIHpwb29scwoKWnN3
YXAgY3JlYXRlcyAzMiB6cG9vbHMgdG8gaW1wcm92ZSBjb25jdXJyZW5jeS4gRWFjaCB6c21hbGxv
YyB6cG9vbApjcmVhdGVzIGl0cyBvd24gJ3pzX2hhbmRsZScgYW5kICd6c3BhZ2UnIHNsYWIgY2Fj
aGVzLiBXZSBlbmQgdXAgd2l0aCAzMgpzbGFiIGNhY2hlcyBvZiBlYWNoIHR5cGUuCgpTaW5jZSBl
YWNoIHNsYWIgY2FjaGUgaG9sZHMgc29tZSBmcmVlIG9iamVjdHMsIHdlIGVuZCB1cCB3aXRoIGEg
bG90IG9mCmZyZWUgb2JqZWN0cyBkaXN0cmlidXRlZCBhbW9uZyB0aGUgc2VwYXJhdGUgenBvb2wg
Y2FjaGVzLiBTbGFiIGNhY2hlcwphcmUgZGVzaWduZWQgdG8gaGFuZGxlIGNvbmN1cnJlbnQgYWxs
b2NhdGlvbnMgYnkgdXNpbmcgcGVyY3B1CnN0cnVjdHVyZXMsIHNvIGhhdmluZyBhIHNpbmdsZSBp
bnN0YW5jZSBvZiBlYWNoIGNhY2hlIHNob3VsZCBiZSBlbm91Z2gsCmFuZCBhdm9pZHMgd2FzdGlu
ZyBtb3JlIG1lbW9yeSB0aGFuIG5lZWRlZCBkdWUgdG8gZnJhZ21lbnRhdGlvbi4KCkFkZGl0aW9u
YWxseSwgaGF2aW5nIG1vcmUgc2xhYiBjYWNoZXMgdGhhbiBuZWVkZWQgdW5uZWNlc3NhcmlseSBz
bG93cwpkb3duIGNvZGUgcGF0aHMgdGhhdCBpdGVyYXRlIHNsYWJfY2FjaGVzLgoKU2lnbmVkLW9m
Zi1ieTogWW9zcnkgQWhtZWQgPHlvc3J5YWhtZWRAZ29vZ2xlLmNvbT4KLS0tCiBtbS96c21hbGxv
Yy5jIHwgNjAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvbW0venNtYWxsb2MuYyBiL21tL3pzbWFsbG9jLmMKaW5kZXggYjQyZDM1NDVj
YTg1Ni4uYzNjOTA2MThlYzhiNCAxMDA2NDQKLS0tIGEvbW0venNtYWxsb2MuYworKysgYi9tbS96
c21hbGxvYy5jCkBAIC0yODksMjkgKzI4OSw4IEBAIHN0YXRpYyB2b2lkIGluaXRfZGVmZXJyZWRf
ZnJlZShzdHJ1Y3QgenNfcG9vbCAqcG9vbCkge30KIHN0YXRpYyB2b2lkIFNldFpzUGFnZU1vdmFi
bGUoc3RydWN0IHpzX3Bvb2wgKnBvb2wsIHN0cnVjdCB6c3BhZ2UgKnpzcGFnZSkge30KICNlbmRp
ZgogCi1zdGF0aWMgaW50IGNyZWF0ZV9jYWNoZShzdHJ1Y3QgenNfcG9vbCAqcG9vbCkKLXsKLQlw
b29sLT5oYW5kbGVfY2FjaGVwID0ga21lbV9jYWNoZV9jcmVhdGUoInpzX2hhbmRsZSIsIFpTX0hB
TkRMRV9TSVpFLAotCQkJCQkwLCAwLCBOVUxMKTsKLQlpZiAoIXBvb2wtPmhhbmRsZV9jYWNoZXAp
Ci0JCXJldHVybiAxOwotCi0JcG9vbC0+enNwYWdlX2NhY2hlcCA9IGttZW1fY2FjaGVfY3JlYXRl
KCJ6c3BhZ2UiLCBzaXplb2Yoc3RydWN0IHpzcGFnZSksCi0JCQkJCTAsIDAsIE5VTEwpOwotCWlm
ICghcG9vbC0+enNwYWdlX2NhY2hlcCkgewotCQlrbWVtX2NhY2hlX2Rlc3Ryb3kocG9vbC0+aGFu
ZGxlX2NhY2hlcCk7Ci0JCXBvb2wtPmhhbmRsZV9jYWNoZXAgPSBOVUxMOwotCQlyZXR1cm4gMTsK
LQl9Ci0KLQlyZXR1cm4gMDsKLX0KLQotc3RhdGljIHZvaWQgZGVzdHJveV9jYWNoZShzdHJ1Y3Qg
enNfcG9vbCAqcG9vbCkKLXsKLQlrbWVtX2NhY2hlX2Rlc3Ryb3kocG9vbC0+aGFuZGxlX2NhY2hl
cCk7Ci0Ja21lbV9jYWNoZV9kZXN0cm95KHBvb2wtPnpzcGFnZV9jYWNoZXApOwotfQorc3RhdGlj
IHN0cnVjdCBrbWVtX2NhY2hlICp6c19oYW5kbGVfY2FjaGU7CitzdGF0aWMgc3RydWN0IGttZW1f
Y2FjaGUgKnpzcGFnZV9jYWNoZTsKIAogc3RhdGljIHVuc2lnbmVkIGxvbmcgY2FjaGVfYWxsb2Nf
aGFuZGxlKHN0cnVjdCB6c19wb29sICpwb29sLCBnZnBfdCBnZnApCiB7CkBAIC0yMTA3LDEzICsy
MDg2LDEzIEBAIHN0cnVjdCB6c19wb29sICp6c19jcmVhdGVfcG9vbChjb25zdCBjaGFyICpuYW1l
KQogCXNwaW5fbG9ja19pbml0KCZwb29sLT5sb2NrKTsKIAlhdG9taWNfc2V0KCZwb29sLT5jb21w
YWN0aW9uX2luX3Byb2dyZXNzLCAwKTsKIAorCXBvb2wtPmhhbmRsZV9jYWNoZXAgPSB6c19oYW5k
bGVfY2FjaGU7CisJcG9vbC0+enNwYWdlX2NhY2hlcCA9IHpzcGFnZV9jYWNoZTsKKwogCXBvb2wt
Pm5hbWUgPSBrc3RyZHVwKG5hbWUsIEdGUF9LRVJORUwpOwogCWlmICghcG9vbC0+bmFtZSkKIAkJ
Z290byBlcnI7CiAKLQlpZiAoY3JlYXRlX2NhY2hlKHBvb2wpKQotCQlnb3RvIGVycjsKLQogCS8q
CiAJICogSXRlcmF0ZSByZXZlcnNlbHksIGJlY2F1c2UsIHNpemUgb2Ygc2l6ZV9jbGFzcyB0aGF0
IHdlIHdhbnQgdG8gdXNlCiAJICogZm9yIG1lcmdpbmcgc2hvdWxkIGJlIGxhcmdlciBvciBlcXVh
bCB0byBjdXJyZW50IHNpemUuCkBAIC0yMjM0LDE2ICsyMjEzLDQxIEBAIHZvaWQgenNfZGVzdHJv
eV9wb29sKHN0cnVjdCB6c19wb29sICpwb29sKQogCQlrZnJlZShjbGFzcyk7CiAJfQogCi0JZGVz
dHJveV9jYWNoZShwb29sKTsKIAlrZnJlZShwb29sLT5uYW1lKTsKIAlrZnJlZShwb29sKTsKIH0K
IEVYUE9SVF9TWU1CT0xfR1BMKHpzX2Rlc3Ryb3lfcG9vbCk7CiAKK3N0YXRpYyB2b2lkIHpzX2Rl
c3Ryb3lfY2FjaGVzKHZvaWQpCit7CisJa21lbV9jYWNoZV9kZXN0cm95KHpzX2hhbmRsZV9jYWNo
ZSk7CisJa21lbV9jYWNoZV9kZXN0cm95KHpzcGFnZV9jYWNoZSk7CisJenNfaGFuZGxlX2NhY2hl
ID0gTlVMTDsKKwl6c3BhZ2VfY2FjaGUgPSBOVUxMOworfQorCitzdGF0aWMgaW50IHpzX2NyZWF0
ZV9jYWNoZXModm9pZCkKK3sKKwl6c19oYW5kbGVfY2FjaGUgPSBrbWVtX2NhY2hlX2NyZWF0ZSgi
enNfaGFuZGxlIiwgWlNfSEFORExFX1NJWkUsCisJCQkJCSAgICAwLCAwLCBOVUxMKTsKKwl6c3Bh
Z2VfY2FjaGUgPSBrbWVtX2NhY2hlX2NyZWF0ZSgienNwYWdlIiwgc2l6ZW9mKHN0cnVjdCB6c3Bh
Z2UpLAorCQkJCQkgMCwgMCwgTlVMTCk7CisKKwlpZiAoIXpzX2hhbmRsZV9jYWNoZSB8fCAhenNw
YWdlX2NhY2hlKSB7CisJCXpzX2Rlc3Ryb3lfY2FjaGVzKCk7CisJCXJldHVybiAtMTsKKwl9CisJ
cmV0dXJuIDA7Cit9CisKIHN0YXRpYyBpbnQgX19pbml0IHpzX2luaXQodm9pZCkKIHsKIAlpbnQg
cmV0OwogCisJcmV0ID0genNfY3JlYXRlX2NhY2hlcygpOworCWlmIChyZXQpCisJCWdvdG8gb3V0
OworCiAJcmV0ID0gY3B1aHBfc2V0dXBfc3RhdGUoQ1BVSFBfTU1fWlNfUFJFUEFSRSwgIm1tL3pz
bWFsbG9jOnByZXBhcmUiLAogCQkJCXpzX2NwdV9wcmVwYXJlLCB6c19jcHVfZGVhZCk7CiAJaWYg
KHJldCkKQEAgLTIyNTgsNiArMjI2Miw3IEBAIHN0YXRpYyBpbnQgX19pbml0IHpzX2luaXQodm9p
ZCkKIAlyZXR1cm4gMDsKIAogb3V0OgorCXpzX2Rlc3Ryb3lfY2FjaGVzKCk7CiAJcmV0dXJuIHJl
dDsKIH0KIApAQCAtMjI2OSw2ICsyMjc0LDcgQEAgc3RhdGljIHZvaWQgX19leGl0IHpzX2V4aXQo
dm9pZCkKIAljcHVocF9yZW1vdmVfc3RhdGUoQ1BVSFBfTU1fWlNfUFJFUEFSRSk7CiAKIAl6c19z
dGF0X2V4aXQoKTsKKwl6c19kZXN0cm95X2NhY2hlcygpOwogfQogCiBtb2R1bGVfaW5pdCh6c19p
bml0KTsKLS0gCjIuNDUuMS4yODguZzBlMGNkMjk5ZjEtZ29vZwoK
--00000000000033ca02061a04a3f5--
