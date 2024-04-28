Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDE48B4D92
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2024 21:03:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tp4kaBYf;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tp4kaBYf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSG7z5Xphz3cXM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 05:03:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tp4kaBYf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tp4kaBYf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSG6N589Nz3c6n
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 05:02:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714330918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pkigxwzJ0pF/T4NqveAQpx8gjiN35IK7jok4Q5z8klI=;
	b=Tp4kaBYfVo+v8FMxDaMou815jjcRz6BC/66RD2KJRAJBG+DTN3qWnImyQ61j6+AaKXCXm0
	M/o8it+q1ifca1RJOb9mEUAz36d4zJtBmMtQeXD+aom71PEC4r8FqN/nDZ80m17J7lkzIA
	U+0DVyceb0PAW8OoR9PEIUtfwvlWBn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714330918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pkigxwzJ0pF/T4NqveAQpx8gjiN35IK7jok4Q5z8klI=;
	b=Tp4kaBYfVo+v8FMxDaMou815jjcRz6BC/66RD2KJRAJBG+DTN3qWnImyQ61j6+AaKXCXm0
	M/o8it+q1ifca1RJOb9mEUAz36d4zJtBmMtQeXD+aom71PEC4r8FqN/nDZ80m17J7lkzIA
	U+0DVyceb0PAW8OoR9PEIUtfwvlWBn0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-sY3B9a4wNLGq7sS3Sm0kiw-1; Sun, 28 Apr 2024 15:01:54 -0400
X-MC-Unique: sY3B9a4wNLGq7sS3Sm0kiw-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-79085537977so2191685a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2024 12:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714330914; x=1714935714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkigxwzJ0pF/T4NqveAQpx8gjiN35IK7jok4Q5z8klI=;
        b=mAX05vZsn3oK2swrXUnhJlKk1Icas1GN0TS72xOFZXXAup2jIcQdmhwRU6Xul4lTjS
         7bY4/wcbcMtHVtzGwHFWlDcZ1jbzkChmWf7OUW71q+hBue6MNEAB6gFf3WVQ8gZdWWaS
         bnQEJnpdYRsLL9tqpw4DD97drcRuTX0NWm3qaGmuE5rAjNcLubpYTNxfonDJucahmTMr
         Jsi091D41bFOHbuIT94nbEGszIAB7tcyBEibxLzTDIqzZTrU0wxCno3bXdjMRvo9Pl6Q
         soDhbf9TQIwVmlWdjonJF+Hn1arNO3AvaRUOCPFelyGYDaBWaxKIO85zN6P1PLD1fGMt
         1NGw==
X-Forwarded-Encrypted: i=1; AJvYcCVt1EjmdTLX+4vIDGyRP0Ri1/H7C1q7+I8xz/4iBjQZ0m1v/BoDnqV5AxykWC2RqtVwXAyIeNR8QGTWk941jsUmvmdpGcmtr8KdXNxksQ==
X-Gm-Message-State: AOJu0Yxl9+dCgu814O5mw/eLDiqmswpawecYRaIddcK4WSH5zFOskWyI
	JIWCveXCeXHZpC6oB0Cw7HDISN+RvwE3v/dstkXyUjW+lLIy9j7Z78/O03Or9LvMF1Mze8wNAby
	0R6pnexb8gEvAzUBSRw9E49AVl+k+FRUClGan1iAFT0QNh/noene/PgKeGWTgTEI=
X-Received: by 2002:a05:620a:17a0:b0:790:e83a:e6eb with SMTP id ay32-20020a05620a17a000b00790e83ae6ebmr4022624qkb.5.1714330913779;
        Sun, 28 Apr 2024 12:01:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc5kc0cZSyusKzQeLAgeOYcB5BLCEjzPmI8Bn8/lrUkN7IeJKwQ4CrGxFGrgIzhwqWtQQFqg==
X-Received: by 2002:a05:620a:17a0:b0:790:e83a:e6eb with SMTP id ay32-20020a05620a17a000b00790e83ae6ebmr4022591qkb.5.1714330913186;
        Sun, 28 Apr 2024 12:01:53 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id oo8-20020a05620a530800b0078d693c0b4bsm9818152qkn.135.2024.04.28.12.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 12:01:52 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/2] mm/gup: Fix hugepd for longterm R/O pin on Power
Date: Sun, 28 Apr 2024 15:01:49 -0400
Message-ID: <20240428190151.201002-1-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Muchun Song <muchun.song@linux.dev>, peterx@redhat.com, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series should apply to both mm-stable and mm-unstable, I am not sure
whether it's even applicable to apply on mm-stable directly, but perhaps
not urgently needed either.  Anyway, it'll apply to either tree.  It also
means cc stable is not needed even if I had the Fixes attached.

Patch 1 fixes that bug in mm-stable, patch 2 enhances the gup_longterm to
be able to discover such issue.

In general, the previous hugetlb rework [1] on gup-slow introduced an issue
with R/O longterm pin.  Nobody yet found it in either a real report or test
case, probably because our test case doesn't yet cover it (not before patch
2), and it's also a pretty rare path: it only happens with Power longterm
R/O pins on a page cache that is installed as a hugepd read-only.

Please read each of the patch for details.

I retested "./run_vmtests.sh -t gup_test -a" on a Power8 system with a
Power8 VM, with 16MB hugepd hugepd entries installed.  Note that I tested
exactly the same matrix before, but patch 2 will change gup_longterm test,
so it's actually slightly different test carried out, and the new test
(gup_longterm.c, when apply patch 2 only) will hang mm-stable on Andrew's
tree with that 16MB huge page.

Thanks,

[1] https://lore.kernel.org/r/20240327152332.950956-1-peterx@redhat.com

Peter Xu (2):
  mm/gup: Fix hugepd handling in hugetlb rework
  mm/selftests: Don't prefault in gup_longterm tests

 mm/gup.c                                  | 64 ++++++++++++++---------
 tools/testing/selftests/mm/gup_longterm.c | 12 +++--
 2 files changed, 48 insertions(+), 28 deletions(-)

-- 
2.44.0

