Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 069CB8C29EB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2024 20:30:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=o4p8LEgG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vbcr45Lktz3cZx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2024 04:30:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=o4p8LEgG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--axelrasmussen.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3i2c-zg0kdiwqdu17q82a88u3w44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--axelrasmussen.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VbcqM6DlPz30W7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2024 04:29:34 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61dfa4090c1so33986697b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2024 11:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715365772; x=1715970572; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A4aKdJv+GXjhmJVck0xZk4SxA4FMRyhRNdrsSEfRwe8=;
        b=o4p8LEgGQzxVF9DCCWx97+O4KFVFpaIF5jIgsKRauN/9zoLj/cRhxXrLbMi1MhsY1m
         UZctVAuDLekBSQMaUahSJVd18Vr0GBQOSveQYlUo7d9hj/xeJIS96iDSQZn4oDIiV1om
         8He2FsQ1hK/f7P3i0PhBB3KOkbURu/P8w4GMR3JuQJTZB9YTVsOUeN6lQCp1YHnDzLXZ
         XlROo2wBlfAsZP1TMjL0gtY7cSXFgEEidtCer9ZFBW2PDw2QlZXZt2iqm1VdMmqdQbI8
         81R+pfEG+rLCssMwalRZ0RGPba3dccEKropnYzkwtuLudm+zR4ajIUBzzxHTaVMShyfi
         EgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715365772; x=1715970572;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A4aKdJv+GXjhmJVck0xZk4SxA4FMRyhRNdrsSEfRwe8=;
        b=JHk+6lRolsIcEWhWH1DVs7lqkhjcmhR1fs3d7Muf930KuZcNaPS/fPyz1VgWNeqvlf
         YbiBveIA5I3rrJ+jRtGjl0lZ4UZmnKFa16UFPLTbgPCcMP0hKKVELyXxhar+mXR1vxlQ
         QgQQ1l/KfI9nF6reMSBrunxUI/FBcBhSHIC1zd2j9gkUOo0xYngSWxATNJJZFPC0kfm3
         TwdUBMAb5QbvbM3XIgcyGhjvLB/z/753Sf1u2S76LALctkR7cNcCbm1T0ix0nRosYUFu
         UccjmHUqpCLqSTjdpNbtZF6DUve8m2aJml79X0y6tQNQops5oULLvLTqXTk+GUA+7F5O
         x/sw==
X-Forwarded-Encrypted: i=1; AJvYcCXlKDGl/MMHa8U7ApVKqk7//vAEjYCypFmw+Y9PldkhNriQScaQIiipcC0twiTdqhEQsX99E0MazT8oQOq95hdsTMGEEBEJZPT7/cIS0Q==
X-Gm-Message-State: AOJu0YyJlVk/6eTCc90VT86ksef0jMICV0FoEh2tMvmxLRps2ZmrLPx9
	l7PCXgEG7sZs2iqsJCwKBVsjytnNXK+HVoHIRrNmZugGjepLzoTzmR0lTUpllfBdysHzy2ZN3Gl
	lUXYgR1VLoC3T/DT1WiypWVhu/7S+cA==
X-Google-Smtp-Source: AGHT+IH5+lH6Gx4AKZE0SlsshevL9DXQMpIE/7ZE3IOzzvFIkXEAIqcFqmW78BWgUllATkZqk48MCmCddH9d0kus7++P
X-Received: from axel.svl.corp.google.com ([2620:15c:2a3:200:6f94:7fe7:5ca2:5501])
 (user=axelrasmussen job=sendgmr) by 2002:a05:690c:6211:b0:618:8bdf:9d56 with
 SMTP id 00721157ae682-622afffb2b1mr8008447b3.7.1715365771987; Fri, 10 May
 2024 11:29:31 -0700 (PDT)
Date: Fri, 10 May 2024 11:29:25 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510182926.763131-1-axelrasmussen@google.com>
Subject: [PATCH v2 0/1] arch/fault: don't print logs for simulated poison errors
From: Axel Rasmussen <axelrasmussen@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Helge Deller <deller@gmx.de>, 
	Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, John Hubbard <jhubbard@nvidia.com>, 
	Liu Shixin <liushixin2@huawei.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Axel Rasmussen <axelrasmussen@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch is based on mm-unstable as of 2024-05-10. In particular it
needs this somewhat related fix to apply cleanly:

  [0/2] Minor fixups for hugetlb fault path
  https://lore.kernel.org/r/20240509100148.22384-1-osalvador@suse.de

Changes since v1:
 - Rename flag from VM_FAULT_HWPOISON_SIM to VM_FAULT_HWPOISON_SILENT.
 - Rebase onto mm-unstable, to remove dependency on another patch which it
   appears will not get merged.
 - Update comments / commit message to mention swapin errors in addition to
   UFFDIO_POISON.

Axel Rasmussen (1):
  arch/fault: don't print logs for pte marker poison errors

 arch/parisc/mm/fault.c   |  7 +++++--
 arch/powerpc/mm/fault.c  |  6 ++++--
 arch/x86/mm/fault.c      |  6 ++++--
 include/linux/mm_types.h | 34 ++++++++++++++++++++--------------
 mm/hugetlb.c             |  3 ++-
 mm/memory.c              |  2 +-
 6 files changed, 36 insertions(+), 22 deletions(-)

--
2.45.0.118.g7fe29c98d7-goog

