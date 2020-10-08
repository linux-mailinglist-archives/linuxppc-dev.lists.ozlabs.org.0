Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8DB287B04
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 19:32:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6dYz1CngzDqW0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 04:32:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=e6YulghK; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6dXG3RvCzDqWP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 04:30:51 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id a5so6608527ljj.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Oct 2020 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0r6hs94To3WnkkAO44dD5WsBrttflbyFzF64gAf7oOc=;
 b=e6YulghKmU2zbj8oKL6vbX/nL87I35BsKkEYWcuZH7T+d/AX9OaAN3D9jG63KOw2L4
 ADpXCUvcjyw+baQIDFxhMRcPcdnFPVKVLKoHXnWEEw3krz9/seeOnSrf8moXkwtHbnjh
 vldct/l7Bf3WG6cp0AqoGhKopct1dBy4/7QLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0r6hs94To3WnkkAO44dD5WsBrttflbyFzF64gAf7oOc=;
 b=UdBdP1X/FC1HvTGZEw+WvXABgM4Y6nfC0Mh7Apqy7AdwWkspBDWJDpJir4ucJTIeXu
 c/lQJm3aCOEiWOF/76SjFP9f+Nx/zS0pLZh5tQG+1Uwq8NOSe2bw6LnmNk5PLrRutMHO
 Gmck0hmnFakpRIs+GpIT/fi3JfgKdW1LLC2iUW87mMr81beI2qkqSketw+BzKy2hZvTD
 KynwRTkwEvgdhjo6kPlpx/lUG3C94pKkVZLZjZ78BfZN/D9Bs+5LoOeCXQWFr2SEMfBv
 yb3ZaJuAVSlVngYdq1S+jM+lizUiRaMHM9x+kDfFM7I9uO/sTO4q7nIuw+XDr7ZMOQqA
 aq3Q==
X-Gm-Message-State: AOAM530naknegcjFAfwZWCMFtd5Xe1FniS3lcrP2Ltw1trK0fnGyRvfX
 7rp3QGdSdoOSrNHRd2SCSMpqDlx/ofBhGg==
X-Google-Smtp-Source: ABdhPJw44Ib3kdzmCe6IwetlUU+qDN99B56UzMO5gbRPFovHR1QYz+kEH51SXi+hF42nB6J9GetD9Q==
X-Received: by 2002:a2e:9055:: with SMTP id n21mr3455058ljg.440.1602178248161; 
 Thu, 08 Oct 2020 10:30:48 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com.
 [209.85.167.49])
 by smtp.gmail.com with ESMTPSA id r4sm955168lfc.162.2020.10.08.10.30.46
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 10:30:47 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id j30so5039860lfp.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Oct 2020 10:30:46 -0700 (PDT)
X-Received: by 2002:a19:2d5:: with SMTP id 204mr1648128lfc.352.1602178246305; 
 Thu, 08 Oct 2020 10:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201008092627.399131-1-aneesh.kumar@linux.ibm.com>
 <CAHk-=whwY0WT046fqM-zdHu9vamUjgkvmd36gCd4qSaeYy98nA@mail.gmail.com>
In-Reply-To: <CAHk-=whwY0WT046fqM-zdHu9vamUjgkvmd36gCd4qSaeYy98nA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 8 Oct 2020 10:30:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=whihCy1qxihM=vVDO0aPx0vFP3wTxizLwtbQSYCr1sZjw@mail.gmail.com>
Message-ID: <CAHk-=whihCy1qxihM=vVDO0aPx0vFP3wTxizLwtbQSYCr1sZjw@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: Fetch the dirty bit before we reset the pte
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Leon Romanovsky <leonro@nvidia.com>
Content-Type: multipart/mixed; boundary="0000000000003d1e2b05b12c3107"
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Linux-MM <linux-mm@kvack.org>, Hugh Dickins <hughd@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Nick Piggin <npiggin@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Kirill Shutemov <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000003d1e2b05b12c3107
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 8, 2020 at 10:02 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Here's the first patch anyway. If you actually have a test-case where
> this matters, I guess I need to apply it now..

Actually, I removed the "__page_mapcount()" part of that patch, to
keep it minimal and _only_ do remove the wrprotect trick.

We can do the __page_mapcount() optimization and the mm sequence count
for 5.10 (although so far nobody has actually written the seqcount
patch - I think it would be a trivial few-liner, but I guess it won't
make 5.10 at this point).

So here's what I ended up with.

                      Linus

--0000000000003d1e2b05b12c3107
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-mm-avoid-early-COW-write-protect-games-during-fork.patch"
Content-Disposition: attachment; 
	filename="0001-mm-avoid-early-COW-write-protect-games-during-fork.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kg13jquu0>
X-Attachment-Id: f_kg13jquu0

RnJvbSBmM2M2NGVkYTNlNTA5N2VjMzE5OGNiMjcxZjVmNTA0ZDY1ZDY3MTMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRh
dGlvbi5vcmc+CkRhdGU6IE1vbiwgMjggU2VwIDIwMjAgMTI6NTA6MDMgLTA3MDAKU3ViamVjdDog
W1BBVENIXSBtbTogYXZvaWQgZWFybHkgQ09XIHdyaXRlIHByb3RlY3QgZ2FtZXMgZHVyaW5nIGZv
cmsoKQoKSW4gY29tbWl0IDcwZTgwNmU0ZTY0NSAoIm1tOiBEbyBlYXJseSBjb3cgZm9yIHBpbm5l
ZCBwYWdlcyBkdXJpbmcgZm9yaygpCmZvciBwdGVzIikgd2Ugd3JpdGUtcHJvdGVjdGVkIHRoZSBQ
VEUgYmVmb3JlIGRvaW5nIHRoZSBwYWdlIHBpbm5pbmcKY2hlY2ssIGluIG9yZGVyIHRvIGF2b2lk
IGEgcmFjZSB3aXRoIGNvbmN1cnJlbnQgZmFzdC1HVVAgcGlubmluZyAod2hpY2gKZG9lc24ndCB0
YWtlIHRoZSBtbSBzZW1hcGhvcmUgb3IgdGhlIHBhZ2UgdGFibGUgbG9jaykuCgpUaGF0IHRyaWNr
IGRvZXNuJ3QgYWN0dWFsbHkgd29yayAtIGl0IGRvZXNuJ3QgaGFuZGxlIG1lbW9yeSBvcmRlcmlu
Zwpwcm9wZXJseSwgYW5kIGRvaW5nIHNvIHdvdWxkIGJlIHByb2hpYml0aXZlbHkgZXhwZW5zaXZl
LgoKSXQgYWxzbyBpc24ndCByZWFsbHkgbmVlZGVkLiAgV2hpbGUgd2UncmUgbW92aW5nIGluIHRo
ZSBkaXJlY3Rpb24gb2YKYWxsb3dpbmcgYW5kIHN1cHBvcnRpbmcgcGFnZSBwaW5uaW5nIHdpdGhv
dXQgbWFya2luZyB0aGUgcGlubmVkIGFyZWEKd2l0aCBNQURWX0RPTlRGT1JLLCB0aGUgZmFjdCBp
cyB0aGF0IHdlJ3ZlIG5ldmVyIHJlYWxseSBzdXBwb3J0ZWQgdGhpcwpraW5kIG9mIG9kZCAiY29u
Y3VycmVudCBmb3JrKCkgYW5kIHBhZ2UgcGlubmluZyIsIGFuZCBkb2luZyB0aGUKc2VyaWFsaXph
dGlvbiBvbiBhIHB0ZSBsZXZlbCBpcyBqdXN0IHdyb25nLgoKV2UgY2FuIGFkZCBzZXJpYWxpemF0
aW9uIHdpdGggYSBwZXItbW0gc2VxdWVuY2UgY291bnRlciwgc28gd2Uga25vdyBob3cKdG8gc29s
dmUgdGhhdCByYWNlIHByb3Blcmx5LCBidXQgd2UnbGwgZG8gdGhhdCBhdCBhIG1vcmUgYXBwcm9w
cmlhdGUKdGltZS4gIFJpZ2h0IG5vdyB0aGlzIGp1c3QgcmVtb3ZlcyB0aGUgd3JpdGUgcHJvdGVj
dCBnYW1lcy4KCkl0IGFsc28gdHVybnMgb3V0IHRoYXQgdGhlIHdyaXRlIHByb3RlY3QgZ2FtZXMg
YWN0dWFsbHkgYnJlYWsgb24gUG93ZXIsCmFzIHJlcG9ydGVkIGJ5IEFuZWVzaCBLdW1hcjoKCiAi
QXJjaGl0ZWN0dXJlIGxpa2UgcHBjNjQgZXhwZWN0cyBzZXRfcHRlX2F0IHRvIGJlIG5vdCB1c2Vk
IGZvciB1cGRhdGluZwogIGEgdmFsaWQgcHRlLiBUaGlzIGlzIGZ1cnRoZXIgZXhwbGFpbmVkIGlu
IGNvbW1pdCA1NmVlY2RiOTEyYjUgKCJtbToKICBVc2UgcHRlcC9wbWRwX3NldF9udW1hKCkgZm9y
IHVwZGF0aW5nIF9QQUdFX05VTUEgYml0IikiCgphbmQgdGhlIGNvZGUgdHJpZ2dlcmVkIGEgd2Fy
bmluZyB0aGVyZToKCiAgV0FSTklORzogQ1BVOiAwIFBJRDogMzA2MTMgYXQgYXJjaC9wb3dlcnBj
L21tL3BndGFibGUuYzoxODUgc2V0X3B0ZV9hdCsweDJhOC8weDNhMCBhcmNoL3Bvd2VycGMvbW0v
cGd0YWJsZS5jOjE4NQogIENhbGwgVHJhY2U6CiAgICBjb3B5X3ByZXNlbnRfcGFnZSBtbS9tZW1v
cnkuYzo4NTcgW2lubGluZV0KICAgIGNvcHlfcHJlc2VudF9wdGUgbW0vbWVtb3J5LmM6ODk5IFtp
bmxpbmVdCiAgICBjb3B5X3B0ZV9yYW5nZSBtbS9tZW1vcnkuYzoxMDE0IFtpbmxpbmVdCiAgICBj
b3B5X3BtZF9yYW5nZSBtbS9tZW1vcnkuYzoxMDkyIFtpbmxpbmVdCiAgICBjb3B5X3B1ZF9yYW5n
ZSBtbS9tZW1vcnkuYzoxMTI3IFtpbmxpbmVdCiAgICBjb3B5X3A0ZF9yYW5nZSBtbS9tZW1vcnku
YzoxMTUwIFtpbmxpbmVdCiAgICBjb3B5X3BhZ2VfcmFuZ2UrMHgxZjZjLzB4MmNjMCBtbS9tZW1v
cnkuYzoxMjEyCiAgICBkdXBfbW1hcCBrZXJuZWwvZm9yay5jOjU5MiBbaW5saW5lXQogICAgZHVw
X21tKzB4NzdjLzB4YWIwIGtlcm5lbC9mb3JrLmM6MTM1NQogICAgY29weV9tbSBrZXJuZWwvZm9y
ay5jOjE0MTEgW2lubGluZV0KICAgIGNvcHlfcHJvY2VzcysweDFmMDAvMHgyNzQwIGtlcm5lbC9m
b3JrLmM6MjA3MAogICAgX2RvX2ZvcmsrMHhjNC8weDEwYjAga2VybmVsL2ZvcmsuYzoyNDI5CgpM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBSGstPXdpV3IrZ08wUm80THZuSkJN
czkwT2llUE55ckUzRStwSnZjOVB6ZEJTaGRtd0BtYWlsLmdtYWlsLmNvbS8KTGluazogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMtZGV2LzIwMjAxMDA4MDkyNTQxLjM5ODA3OS0xLWFu
ZWVzaC5rdW1hckBsaW51eC5pYm0uY29tLwpSZXBvcnRlZC1ieTogQW5lZXNoIEt1bWFyIEsuViA8
YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+ClRlc3RlZC1ieTogTGVvbiBSb21hbm92c2t5IDxs
ZW9ucm9AbnZpZGlhLmNvbT4KQ2M6IFBldGVyIFh1IDxwZXRlcnhAcmVkaGF0LmNvbT4KQ2M6IEph
c29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgpDYzogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4K
Q2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNl
LmNvbT4KQ2M6IEtpcmlsbCBTaHV0ZW1vdiA8a2lyaWxsQHNodXRlbW92Lm5hbWU+CkNjOiBIdWdo
IERpY2tpbnMgPGh1Z2hkQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IExpbnVzIFRvcnZhbGRz
IDx0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZz4KLS0tCiBtbS9tZW1vcnkuYyB8IDQxICsr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9tZW1vcnku
YyBiL21tL21lbW9yeS5jCmluZGV4IGZjZmM0Y2EzNmViYS4uZWVhZTU5MGU1MjZhIDEwMDY0NAot
LS0gYS9tbS9tZW1vcnkuYworKysgYi9tbS9tZW1vcnkuYwpAQCAtODA2LDggKzgwNiw2IEBAIGNv
cHlfcHJlc2VudF9wYWdlKHN0cnVjdCBtbV9zdHJ1Y3QgKmRzdF9tbSwgc3RydWN0IG1tX3N0cnVj
dCAqc3JjX21tLAogCQlyZXR1cm4gMTsKIAogCS8qCi0JICogVGhlIHRyaWNrIHN0YXJ0cy4KLQkg
KgogCSAqIFdoYXQgd2Ugd2FudCB0byBkbyBpcyB0byBjaGVjayB3aGV0aGVyIHRoaXMgcGFnZSBt
YXkKIAkgKiBoYXZlIGJlZW4gcGlubmVkIGJ5IHRoZSBwYXJlbnQgcHJvY2Vzcy4gIElmIHNvLAog
CSAqIGluc3RlYWQgb2Ygd3Jwcm90ZWN0IHRoZSBwdGUgb24gYm90aCBzaWRlcywgd2UgY29weQpA
QCAtODE1LDQ3ICs4MTMsMTYgQEAgY29weV9wcmVzZW50X3BhZ2Uoc3RydWN0IG1tX3N0cnVjdCAq
ZHN0X21tLCBzdHJ1Y3QgbW1fc3RydWN0ICpzcmNfbW0sCiAJICogdGhlIHBpbm5lZCBwYWdlIHdv
bid0IGJlIHJhbmRvbWx5IHJlcGxhY2VkIGluIHRoZQogCSAqIGZ1dHVyZS4KIAkgKgotCSAqIFRv
IGFjaGlldmUgdGhpcywgd2UgZG8gdGhlIGZvbGxvd2luZzoKLQkgKgotCSAqIDEuIFdyaXRlLXBy
b3RlY3QgdGhlIHB0ZSBpZiBpdCdzIHdyaXRhYmxlLiAgVGhpcyBpcwotCSAqICAgIHRvIHByb3Rl
Y3QgY29uY3VycmVudCB3cml0ZSBmYXN0LWd1cCB3aXRoCi0JICogICAgRk9MTF9QSU4sIHNvIHRo
YXQgd2UnbGwgZmFpbCB0aGUgZmFzdC1ndXAgd2l0aAotCSAqICAgIHRoZSB3cml0ZSBiaXQgcmVt
b3ZlZC4KLQkgKgotCSAqIDIuIENoZWNrIHBhZ2VfbWF5YmVfZG1hX3Bpbm5lZCgpIHRvIHNlZSB3
aGV0aGVyIHRoaXMKLQkgKiAgICBwYWdlIG1heSBoYXZlIGJlZW4gcGlubmVkLgotCSAqCi0JICog
VGhlIG9yZGVyIG9mIHRoZXNlIHN0ZXBzIGlzIGltcG9ydGFudCB0byBzZXJpYWxpemUKLQkgKiBh
Z2FpbnN0IHRoZSBmYXN0LWd1cCBjb2RlIChndXBfcHRlX3JhbmdlKCkpIG9uIHRoZQotCSAqIHB0
ZSBjaGVjayBhbmQgdHJ5X2dyYWJfY29tcG91bmRfaGVhZCgpLCBzbyB0aGF0Ci0JICogd2UnbGwg
bWFrZSBzdXJlIGVpdGhlciB3ZSdsbCBjYXB0dXJlIHRoYXQgZmFzdC1ndXAKLQkgKiBzbyB3ZSds
bCBjb3B5IHRoZSBwaW5uZWQgcGFnZSBoZXJlLCBvciB3ZSdsbCBmYWlsCi0JICogdGhhdCBmYXN0
LWd1cC4KLQkgKgotCSAqIE5PVEUhIEV2ZW4gaWYgd2UgZG9uJ3QgZW5kIHVwIGNvcHlpbmcgdGhl
IHBhZ2UsCi0JICogd2Ugd29uJ3QgdW5kbyB0aGlzIHdycHJvdGVjdCgpLCBiZWNhdXNlIHRoZSBu
b3JtYWwKLQkgKiByZWZlcmVuY2UgY29weSB3aWxsIG5lZWQgaXQgYW55d2F5LgotCSAqLwotCWlm
IChwdGVfd3JpdGUocHRlKSkKLQkJcHRlcF9zZXRfd3Jwcm90ZWN0KHNyY19tbSwgYWRkciwgc3Jj
X3B0ZSk7Ci0KLQkvKgotCSAqIFRoZXNlIGFyZSB0aGUgIm5vcm1hbGx5IHdlIGNhbiBqdXN0IGNv
cHkgYnkgcmVmZXJlbmNlIgotCSAqIGNoZWNrcy4KKwkgKiBUaGUgcGFnZSBwaW5uaW5nIGNoZWNr
cyBhcmUganVzdCAiaGFzIHRoaXMgbW0gZXZlcgorCSAqIHNlZW4gcGlubmluZyIsIGFsb25nIHdp
dGggdGhlIChpbmV4YWN0KSBjaGVjayBvZgorCSAqIHRoZSBwYWdlIGNvdW50LiBUaGF0IG1pZ2h0
IGdpdmUgZmFsc2UgcG9zaXRpdmVzIGZvcgorCSAqIGZvciBwaW5uaW5nLCBidXQgaXQgd2lsbCB3
b3JrIGNvcnJlY3RseS4KIAkgKi8KIAlpZiAobGlrZWx5KCFhdG9taWNfcmVhZCgmc3JjX21tLT5o
YXNfcGlubmVkKSkpCiAJCXJldHVybiAxOwogCWlmIChsaWtlbHkoIXBhZ2VfbWF5YmVfZG1hX3Bp
bm5lZChwYWdlKSkpCiAJCXJldHVybiAxOwogCi0JLyoKLQkgKiBVaGh1aC4gSXQgbG9va3MgbGlr
ZSB0aGUgcGFnZSBtaWdodCBiZSBhIHBpbm5lZCBwYWdlLAotCSAqIGFuZCB3ZSBhY3R1YWxseSBu
ZWVkIHRvIGNvcHkgaXQuIE5vdyB3ZSBjYW4gc2V0IHRoZQotCSAqIHNvdXJjZSBwdGUgYmFjayB0
byBiZWluZyB3cml0YWJsZS4KLQkgKi8KLQlpZiAocHRlX3dyaXRlKHB0ZSkpCi0JCXNldF9wdGVf
YXQoc3JjX21tLCBhZGRyLCBzcmNfcHRlLCBwdGUpOwotCiAJbmV3X3BhZ2UgPSAqcHJlYWxsb2M7
CiAJaWYgKCFuZXdfcGFnZSkKIAkJcmV0dXJuIC1FQUdBSU47Ci0tIAoyLjI4LjAuMjE4LmdjMTJl
ZjNkMzQ5Cgo=
--0000000000003d1e2b05b12c3107--
