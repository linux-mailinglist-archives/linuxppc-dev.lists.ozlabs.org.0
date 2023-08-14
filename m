Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FB077C196
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 22:38:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=oalxsU2+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPmSd5FGSz3cRJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 06:38:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=oalxsU2+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPmRk160Cz3bTC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 06:37:36 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe2d620d17so8025e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 13:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692045449; x=1692650249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l+mxKdG4Ol6Hz2Wq+bm6V6z9RGpAReV66kl1RzPgk0E=;
        b=oalxsU2+jQ9cT3fVTCpQGRdbwbKK8Iu2ZWjEcVM1oP5kJ7aiO8qRjI77CcsEp34vs5
         D/3+Bahr/IxNTnF9PxktVwP681DXpx2+4epAQ/GMckJ7kfBw7+I/x6VMoOAez1iH3ECx
         g8JsOfEm9AgJwB02FQMj5ChH4S+sTA7BP8cGDtCxx+6BA7b8jqxZGrPSa3lAkIJmAGtd
         MNDs55nI89EW+QG955q50VDQZxpMoap8/iQlOB4LCzCg4TmkqMqRKUHgP4Wc6pwJtIOZ
         rsvsNDxdH23CjHJRa9AyKrWBuHoMorqIlJ/kmR9KwbAsyQnB39g7+BgM4HGsB+JlVxkA
         1Olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692045449; x=1692650249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+mxKdG4Ol6Hz2Wq+bm6V6z9RGpAReV66kl1RzPgk0E=;
        b=IWL39Zub3BfCfOhCeKAP8QE8MAYvNOmBdfqlDXNb6OluYkqJT8Vr8DrNUBuJKoRhpY
         SLwPnh0P1UAh1Mi7PVhEPRRPjSQ+sVy6iqfSqLxwGn0QGx91rLQTPLTAFiNp1JKCxMFX
         +OkHs3NuTot0YUV3/MkMqhmeZD5Usj3mL52Kw+I3eaZWe6MZRcXphnGurmQLekNLBzeY
         16J67iG4+KowmHJxhpSrzn+KWnQ3JSP/c6ihdYrDZPtDaEmgsq8oSzZCKAD8VckEjcIC
         l9VWWY+mml3ly5Bw2i/FM2jMf4qiHutATEJccs1bDsSbdrPd9/B/MV2jPjaf1lqyxSgf
         ENbA==
X-Gm-Message-State: AOJu0YyVDZx5JIUtBQmxwtNRlfHH44faQ7O/nhxWfKEy9YvFmbTldB2d
	3QH7PXqAohb7uVEb6uQhDlGpNSos0D48RMlV6RU6TQ==
X-Google-Smtp-Source: AGHT+IEY8CT3hvyBTRx7jwSfo+JZaL1VNgCRnMYjtExHKr4rSNymxxb98FGC0EJOHSC7Q9QsgOcS+iPtfxuWDLbfWZI=
X-Received: by 2002:a1c:7901:0:b0:3fc:75d:8f85 with SMTP id
 l1-20020a1c7901000000b003fc075d8f85mr338604wme.6.1692045449258; Mon, 14 Aug
 2023 13:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com> <b53be6a4-7715-51f9-aad-f1347dcb7c4@google.com>
In-Reply-To: <b53be6a4-7715-51f9-aad-f1347dcb7c4@google.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 14 Aug 2023 22:36:52 +0200
Message-ID: <CAG48ez0FxiRC4d3VTu_a9h=rg5FW-kYD5Rg5xo_RDBM0LTTqZQ@mail.gmail.com>
Subject: [BUG] Re: [PATCH v3 10/13] mm/khugepaged: collapse_pte_mapped_thp()
 with mmap_read_lock()
To: Hugh Dickins <hughd@google.com>
Content-Type: multipart/mixed; boundary="000000000000f33d7f0602e8077a"
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.
 hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000f33d7f0602e8077a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 6:42=E2=80=AFAM Hugh Dickins <hughd@google.com> wro=
te:
> Bring collapse_and_free_pmd() back into collapse_pte_mapped_thp().
> It does need mmap_read_lock(), but it does not need mmap_write_lock(),
> nor vma_start_write() nor i_mmap lock nor anon_vma lock.  All racing
> paths are relying on pte_offset_map_lock() and pmd_lock(), so use those.

We can still have a racing userfaultfd operation at the "/* step 4:
remove page table */" point that installs a new PTE before the page
table is removed.

To reproduce, patch a delay into the kernel like this:


diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 9a6e0d507759..27cc8dfbf3a7 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -20,6 +20,7 @@
 #include <linux/swapops.h>
 #include <linux/shmem_fs.h>
 #include <linux/ksm.h>
+#include <linux/delay.h>

 #include <asm/tlb.h>
 #include <asm/pgalloc.h>
@@ -1617,6 +1618,11 @@ int collapse_pte_mapped_thp(struct mm_struct
*mm, unsigned long addr,
        }

        /* step 4: remove page table */
+       if (strcmp(current->comm, "DELAYME") =3D=3D 0) {
+               pr_warn("%s: BEGIN DELAY INJECTION\n", __func__);
+               mdelay(5000);
+               pr_warn("%s: END DELAY INJECTION\n", __func__);
+       }

        /* Huge page lock is still held, so page table must remain empty */
        pml =3D pmd_lock(mm, pmd);


And then run the attached reproducer against mm/mm-everything. You
should get this in dmesg:

[  206.578096] BUG: Bad rss-counter state mm:000000000942ebea
type:MM_ANONPAGES val:1

--000000000000f33d7f0602e8077a
Content-Type: text/x-csrc; charset="US-ASCII"; name="khugepaged-vs-uffd.c"
Content-Disposition: attachment; filename="khugepaged-vs-uffd.c"
Content-Transfer-Encoding: base64
Content-ID: <f_llbc3mq60>
X-Attachment-Id: f_llbc3mq60

Ly8gY29tcGlsZSB3aXRoICJnY2MgLW8ga2h1Z2VwYWdlZC12cy11ZmZkIGtodWdlcGFnZWQtdnMt
dWZmZC5jIC1wdGhyZWFkIgojZGVmaW5lIF9HTlVfU09VUkNFCiNpbmNsdWRlIDxwdGhyZWFkLmg+
CiNpbmNsdWRlIDxlcnIuaD4KI2luY2x1ZGUgPHNjaGVkLmg+CiNpbmNsdWRlIDxzdGRpby5oPgoj
aW5jbHVkZSA8c3RyaW5nLmg+CiNpbmNsdWRlIDxmY250bC5oPgojaW5jbHVkZSA8c2lnbmFsLmg+
CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHVuaXN0ZC5oPgojaW5jbHVkZSA8c3lzL3N5
c2NhbGwuaD4KI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CiNpbmNsdWRlIDxzeXMvcHJjdGwuaD4KI2lu
Y2x1ZGUgPHN5cy9tb3VudC5oPgojaW5jbHVkZSA8c3lzL21tYW4uaD4KI2luY2x1ZGUgPHN5cy9p
b2N0bC5oPgojaW5jbHVkZSA8bGludXgvdXNlcmZhdWx0ZmQuaD4KCiNpZm5kZWYgTUFEVl9DT0xM
QVBTRQojZGVmaW5lIE1BRFZfQ09MTEFQU0UgMjUKI2VuZGlmCgojaWZuZGVmIFVGRkRfVVNFUl9N
T0RFX09OTFkKI2RlZmluZSBVRkZEX1VTRVJfTU9ERV9PTkxZIDEKI2VuZGlmCgojZGVmaW5lIFNZ
U0NISyh4KSAoeyAgICAgICAgICBcCiAgdHlwZW9mKHgpIF9fcmVzID0gKHgpOyAgICAgIFwKICBp
ZiAoX19yZXMgPT0gKHR5cGVvZih4KSktMSkgXAogICAgZXJyKDEsICJTWVNDSEsoIiAjeCAiKSIp
OyBcCiAgX19yZXM7ICAgICAgICAgICAgICAgICAgICAgIFwKfSkKCnN0YXRpYyB2b2lkIHdyaXRl
X2ZpbGUoY2hhciAqbmFtZSwgY2hhciAqYnVmKSB7CiAgaW50IGZkID0gU1lTQ0hLKG9wZW4obmFt
ZSwgT19XUk9OTFkpKTsKICBpZiAod3JpdGUoZmQsIGJ1Ziwgc3RybGVuKGJ1ZikpICE9IHN0cmxl
bihidWYpKQogICAgZXJyKDEsICJ3cml0ZSAlcyIsIG5hbWUpOwogIGNsb3NlKGZkKTsKfQoKc3Rh
dGljIHZvaWQgd3JpdGVfbWFwKGNoYXIgKm5hbWUsIGludCBvdXRlcl9pZCkgewogIGNoYXIgYnVm
WzEwMF07CiAgc3ByaW50ZihidWYsICIwICVkIDEiLCBvdXRlcl9pZCk7CiAgd3JpdGVfZmlsZShu
YW1lLCBidWYpOwp9CgpzdGF0aWMgdm9pZCAqdGhyZWFkX2ZuKHZvaWQgKmR1bW15KSB7CiAgc3lz
dGVtKCJoZWFkIC1uNTAgL3Byb2MvJFBQSUQvc21hcHM7ZWNobztlY2hvIik7CiAgU1lTQ0hLKHBy
Y3RsKFBSX1NFVF9OQU1FLCAiREVMQVlNRSIpKTsKICBTWVNDSEsobWFkdmlzZSgodm9pZCopMHgy
MDAwMDBVTCwgMHgyMDAwMDAsIE1BRFZfQ09MTEFQU0UpKTsKICBTWVNDSEsocHJjdGwoUFJfU0VU
X05BTUUsICJ0aHJlYWQiKSk7CiAgc3lzdGVtKCJoZWFkIC1uNTAgL3Byb2MvJFBQSUQvc21hcHMi
KTsKICByZXR1cm4gTlVMTDsKfQoKaW50IG1haW4odm9pZCkgewogIGludCBvdXRlcl91aWQgPSBn
ZXR1aWQoKTsKICBpbnQgb3V0ZXJfZ2lkID0gZ2V0Z2lkKCk7CiAgU1lTQ0hLKHVuc2hhcmUoQ0xP
TkVfTkVXTlN8Q0xPTkVfTkVXVVNFUikpOwogIFNZU0NISyhtb3VudChOVUxMLCAiLyIsIE5VTEws
IE1TX1BSSVZBVEV8TVNfUkVDLCBOVUxMKSk7CiAgd3JpdGVfZmlsZSgiL3Byb2Mvc2VsZi9zZXRn
cm91cHMiLCAiZGVueSIpOwogIHdyaXRlX21hcCgiL3Byb2Mvc2VsZi91aWRfbWFwIiwgb3V0ZXJf
dWlkKTsKICB3cml0ZV9tYXAoIi9wcm9jL3NlbGYvZ2lkX21hcCIsIG91dGVyX2dpZCk7CgogIFNZ
U0NISyhtb3VudCgibm9uZSIsICIvdG1wIiwgInRtcGZzIiwgTVNfTk9TVUlEfE1TX05PREVWLCAi
aHVnZT1hbHdheXMiKSk7CiAgaW50IGZkID0gU1lTQ0hLKG9wZW4oIi90bXAvYSIsIE9fUkRXUnxP
X0NSRUFULCAwNjAwKSk7CiAgU1lTQ0hLKGZ0cnVuY2F0ZShmZCwgMHgyMDAwMDApKTsKICB2b2lk
ICpwdHIgPSBTWVNDSEsobW1hcCgodm9pZCopMHgyMDAwMDBVTCwgMHgxMDAwMDAsIFBST1RfUkVB
RHxQUk9UX1dSSVRFLCBNQVBfUFJJVkFURXxNQVBfRklYRURfTk9SRVBMQUNFLCBmZCwgMCkpOwog
ICoodm9sYXRpbGUgY2hhciAqKXB0cjsKICBTWVNDSEsobW1hcCgodm9pZCopMHgzMDAwMDBVTCwg
MHgxMDAwMDAsIFBST1RfUkVBRHxQUk9UX1dSSVRFLCBNQVBfUFJJVkFURXxNQVBfRklYRURfTk9S
RVBMQUNFLCBmZCwgMHgxMDAwMDApKTsKICBmb3IgKGludCBpPTA7IGk8NTEyOyBpKyspCiAgICAq
KHZvbGF0aWxlIGNoYXIgKikoMHgyMDAwMDBVTCArIDB4MTAwMCAqIGkpOwoKICBpbnQgdWZmZCA9
IFNZU0NISyhzeXNjYWxsKF9fTlJfdXNlcmZhdWx0ZmQsIFVGRkRfVVNFUl9NT0RFX09OTFkpKTsK
CiAgc3RydWN0IHVmZmRpb19hcGkgYXBpID0geyAuYXBpID0gVUZGRF9BUEksIC5mZWF0dXJlcyA9
IDAgfTsKICBTWVNDSEsoaW9jdGwodWZmZCwgVUZGRElPX0FQSSwgJmFwaSkpOwoKICBzdHJ1Y3Qg
dWZmZGlvX3JlZ2lzdGVyIHJlZyA9IHsKICAgIC5yYW5nZSA9IHsgLnN0YXJ0ID0gMHgyMDAwMDAs
IC5sZW4gPSAweDIwMDAwMCB9LAogICAgLm1vZGUgPSBVRkZESU9fUkVHSVNURVJfTU9ERV9NSVNT
SU5HCiAgfTsKICBTWVNDSEsoaW9jdGwodWZmZCwgVUZGRElPX1JFR0lTVEVSLCAmcmVnKSk7Cgog
IHB0aHJlYWRfdCB0aHJlYWQ7CiAgaWYgKHB0aHJlYWRfY3JlYXRlKCZ0aHJlYWQsIE5VTEwsIHRo
cmVhZF9mbiwgTlVMTCkpCiAgICBlcnJ4KDEsICJwdGhyZWFkX2NyZWF0ZSIpOwoKICBzbGVlcCgx
KTsKCiAgdW5zaWduZWQgY2hhciBkdW1teV9wYWdlWzB4MTAwMF0gPSB7MX07CiAgc3RydWN0IHVm
ZmRpb19jb3B5IGNvcHkgPSB7CiAgICAuZHN0ID0gMHgyMDEwMDAsCiAgICAuc3JjID0gKHVuc2ln
bmVkIGxvbmcpZHVtbXlfcGFnZSwKICAgIC5sZW4gPSAweDEwMDAsCiAgICAubW9kZSA9IDAKICB9
OwogIFNZU0NISyhpb2N0bCh1ZmZkLCBVRkZESU9fQ09QWSwgJmNvcHkpKTsKCiAgaWYgKHB0aHJl
YWRfam9pbih0aHJlYWQsIE5VTEwpKQogICAgZXJyeCgxLCAicHRocmVhZF9qb2luIik7CgogIC8v
c3lzdGVtKCJjYXQgL3Byb2MvJFBQSUQvc21hcHMiKTsKfQo=
--000000000000f33d7f0602e8077a--
