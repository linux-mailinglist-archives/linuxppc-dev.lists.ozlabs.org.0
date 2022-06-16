Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D30A54D8A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 04:55:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmxP1TsGz3dQN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 12:55:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.a=rsa-sha256 header.s=zmail header.b=hl+SlRQ+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.beauty (client-ip=136.143.188.15; helo=sender4-op-o15.zoho.com; envelope-from=me@linux.beauty; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.beauty header.i=me@linux.beauty header.a=rsa-sha256 header.s=zmail header.b=hl+SlRQ+;
	dkim-atps=neutral
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNmYC1nXWz3f7b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 12:37:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1655347046; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kKUROtxymjZezs9cT2ZiJGyWhOPUVbE1U3BJj9UG8IHe3doVKhfScKXlfFFNFKvk8jEEtSrcqkXoz6jbi6A6IE/2BtVivQzpCQMNc2xtTqzBnBb+D5D9Qj8SUDQZcJf8aeCZc3U9u1lg1WXWirs7H7BeUo16Iqve1bSogHPFlTQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1655347046; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=UTB7B5gk3AYWkveS3V3eiAvtmejZR2cONemP8U7wTMk=; 
	b=TQNKxSh5BnAMpV6yqYxSNs+G7F8Vn1oFC1d4VTo21Lyl4LDWe3Udeg5/+lv0J8QCtcu7BAgLMFdAXzzdY90q81JGb6LhIzFnZofC8fwHD0Z7K7zvbQ+FnSha7BcMtSTVRSSAew2GNFwjJeRiEj8bq9QnecAJVRBQlCxHfqqcGw8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1655347046;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UTB7B5gk3AYWkveS3V3eiAvtmejZR2cONemP8U7wTMk=;
	b=hl+SlRQ++BmS0VtHjNKmolO/RTggWyIgREPLTZz+eX0m2yEb32mSdLN5kadPYdjn
	+/PHKXBSq+3T0osf+LvfFbsex72VR26BdtbemWLWZB9Mg9r3upkAYfjD0GijcaGCNQr
	nPxv51kXAjDcu3a33IPNp3xvql8tQ/pe+7y3GXFs=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1655347044489121.50435874726236; Wed, 15 Jun 2022 19:37:24 -0700 (PDT)
Date: Wed, 15 Jun 2022 19:37:24 -0700
From: Li Chen <me@linux.beauty>
To: "Baoquan He" <bhe@redhat.com>
Message-ID: <1816a5f606e.e04b74691938779.8131546087211870513@linux.beauty>
In-Reply-To: <YqqPiU+tkCh+vXC/@MiWiFi-R3L-srv>
References: <18165bf7271.d72aa7571639569.7041635736718062250@linux.beauty> <YqqPiU+tkCh+vXC/@MiWiFi-R3L-srv>
Subject: Re: [PATCH] kexec: replace crash_mem_range with range
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
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
Cc: kexec <kexec@lists.infradead.org>, Paul Mackerras <paulus@samba.org>, Eric Biederman <ebiederm@xmission.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baoquan,

 ---- On Wed, 15 Jun 2022 19:03:53 -0700 Baoquan He <bhe@redhat.com> wrote ----
 > On 06/14/22 at 10:04pm, Li Chen wrote:
 > > From: Li Chen <lchen@ambarella.com>
 > > 
 > > We already have struct range, so just use it.
 > 
 > Looks good, have you tested it?

No, I don't have ppc machine, just pass compile on x86.

Regards,
Li

 > 
 > > 
 > > Signed-off-by: Li Chen <lchen@ambarella.com>
 > > ---
 > >  arch/powerpc/kexec/file_load_64.c | 2 +-
 > >  arch/powerpc/kexec/ranges.c       | 8 ++++----
 > >  include/linux/kexec.h             | 7 ++-----
 > >  kernel/kexec_file.c               | 2 +-
 > >  4 files changed, 8 insertions(+), 11 deletions(-)
 > > 
 > > diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
 > > index b4981b651d9a..583b7fc478f2 100644
 > > --- a/arch/powerpc/kexec/file_load_64.c
 > > +++ b/arch/powerpc/kexec/file_load_64.c
 > > @@ -34,7 +34,7 @@ struct umem_info {
 > >  
 > >      /* usable memory ranges to look up */
 > >      unsigned int nr_ranges;
 > > -    const struct crash_mem_range *ranges;
 > > +    const struct range *ranges;
 > >  };
 > >  
 > >  const struct kexec_file_ops * const kexec_file_loaders[] = {
 > > diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
 > > index 563e9989a5bf..5fc53a5fcfdf 100644
 > > --- a/arch/powerpc/kexec/ranges.c
 > > +++ b/arch/powerpc/kexec/ranges.c
 > > @@ -33,7 +33,7 @@
 > >  static inline unsigned int get_max_nr_ranges(size_t size)
 > >  {
 > >      return ((size - sizeof(struct crash_mem)) /
 > > -        sizeof(struct crash_mem_range));
 > > +        sizeof(struct range));
 > >  }
 > >  
 > >  /**
 > > @@ -51,7 +51,7 @@ static inline size_t get_mem_rngs_size(struct crash_mem *mem_rngs)
 > >          return 0;
 > >  
 > >      size = (sizeof(struct crash_mem) +
 > > -        (mem_rngs->max_nr_ranges * sizeof(struct crash_mem_range)));
 > > +        (mem_rngs->max_nr_ranges * sizeof(struct range)));
 > >  
 > >      /*
 > >       * Memory is allocated in size multiple of MEM_RANGE_CHUNK_SZ.
 > > @@ -98,7 +98,7 @@ static int __add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
 > >   */
 > >  static void __merge_memory_ranges(struct crash_mem *mem_rngs)
 > >  {
 > > -    struct crash_mem_range *ranges;
 > > +    struct range *ranges;
 > >      int i, idx;
 > >  
 > >      if (!mem_rngs)
 > > @@ -123,7 +123,7 @@ static void __merge_memory_ranges(struct crash_mem *mem_rngs)
 > >  /* cmp_func_t callback to sort ranges with sort() */
 > >  static int rngcmp(const void *_x, const void *_y)
 > >  {
 > > -    const struct crash_mem_range *x = _x, *y = _y;
 > > +    const struct range *x = _x, *y = _y;
 > >  
 > >      if (x->start > y->start)
 > >          return 1;
 > > diff --git a/include/linux/kexec.h b/include/linux/kexec.h
 > > index 58d1b58a971e..d7ab4ad4c619 100644
 > > --- a/include/linux/kexec.h
 > > +++ b/include/linux/kexec.h
 > > @@ -17,6 +17,7 @@
 > >  
 > >  #include <linux/crash_core.h>
 > >  #include <asm/io.h>
 > > +#include <linux/range.h>
 > >  
 > >  #include <uapi/linux/kexec.h>
 > >  
 > > @@ -214,14 +215,10 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf);
 > >  /* Alignment required for elf header segment */
 > >  #define ELF_CORE_HEADER_ALIGN   4096
 > >  
 > > -struct crash_mem_range {
 > > -    u64 start, end;
 > > -};
 > > -
 > >  struct crash_mem {
 > >      unsigned int max_nr_ranges;
 > >      unsigned int nr_ranges;
 > > -    struct crash_mem_range ranges[];
 > > +    struct range ranges[];
 > >  };
 > >  
 > >  extern int crash_exclude_mem_range(struct crash_mem *mem,
 > > diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
 > > index 8347fc158d2b..f2758af86b93 100644
 > > --- a/kernel/kexec_file.c
 > > +++ b/kernel/kexec_file.c
 > > @@ -1183,7 +1183,7 @@ int crash_exclude_mem_range(struct crash_mem *mem,
 > >  {
 > >      int i, j;
 > >      unsigned long long start, end, p_start, p_end;
 > > -    struct crash_mem_range temp_range = {0, 0};
 > > +    struct range temp_range = {0, 0};
 > >  
 > >      for (i = 0; i < mem->nr_ranges; i++) {
 > >          start = mem->ranges[i].start;
 > > -- 
 > > 2.36.1
 > > 
 > > 
 > > 
 > > _______________________________________________
 > > kexec mailing list
 > > kexec@lists.infradead.org
 > > http://lists.infradead.org/mailman/listinfo/kexec
 > > 
 > 
 > 
