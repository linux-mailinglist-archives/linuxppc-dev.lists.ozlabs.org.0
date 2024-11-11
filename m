Return-Path: <linuxppc-dev+bounces-3096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7649C47F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2024 22:21:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnMth3gznz2y8B;
	Tue, 12 Nov 2024 08:21:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731360108;
	cv=none; b=MFGFxmWWI0zDTkkyfDNJUzpeg2QLcNJ2fcSsfzEoJ/hEzjeeSpnTLI1fcobrTrSBk2Ec4Awla+22SY94Sg8vctjYgDIjRglV9NCWXtPho10+OwiwivrfMqUZsIhL6nVnD130zRL+Nfr0TDWLepWBmSrEPoS51Mzhuz/yoPNkjPsMeTzxNKpXqq3y9Rdbx3LbC7bxxW3Zxl4ys+UQ256BQ70bqSJtTnoWYvy8BA7OqNg5gNquqGi2kkZ/SWximCOJygUpn8gbZKJ4vP2otyP/rFwL0z1twympSZC/IY3YwAxNunByFiA89NufUTG7mO3Co+9VowP52DWv3RH0S1JcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731360108; c=relaxed/relaxed;
	bh=TLnHLRpX4FgJDKaQVlTjZrusIwYcyb5vNTLCS3vgVJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvhOnMYVkrvtJsR0SUIHJ0GNvRrUQa0rTyTZidN2ZjbyfJgvqFvCyf43XoSzxrwHAvI0BorjQ/pjTNz5Voloc8LoCHhbph60euTjJm9aykm7IB8Z818VX8dIWRYA5+jVtCzZJnVmsIGlh/ClsjaxM939KjhKFDYB5R0xHo1t9X8Op2l0cstTPjD0xBb1WLYS9e6vkOnGdibU9n1+i7gGoVEuW1hGn8oRH1Uh+Zkx1WpleeLMJwewvOgUNbsRWHd2IIjqgH75Mm7mQvM3DoEkXPNAhVRwsviIKzjf40LZDfWjYS0iCWhoo2q0/8gomaCyZc6hJgHRTivkfqHzAK+mIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2Rfsly2K; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2Rfsly2K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnMtd26Hqz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 08:21:44 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539e617ef81so697e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2024 13:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731360096; x=1731964896; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLnHLRpX4FgJDKaQVlTjZrusIwYcyb5vNTLCS3vgVJc=;
        b=2Rfsly2K7z4ggBXk7IPuiH1uiJ76tbkpzAlgV8o53wyDDbPQbEabyrzw3CdZ57StqF
         EqiUxsmSPJ3yZky5lD8U82Wq6MrypU8vfQHnAum0h+6awq0ugMwDaaxhLUY+FW1svONZ
         5UZyoD+GzYdfAx2RbpDB8IcnmS+ydTvhXfgptAXxmjAZdCIIWd0ShnakyJDsn3rBrH35
         QNiysQ+dzEKVlO3sTGRWmW6SfGXWf5MYel5Oi4nuapBr7AKgdyCjslr1JbnEjNRR4+Fw
         r/D7Ure124x+V+maaq0eTEA7fZylDxgeiE0fy/R/fltGu+e5eKoIrDCY9BUbvV6NC1hj
         2o+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731360096; x=1731964896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLnHLRpX4FgJDKaQVlTjZrusIwYcyb5vNTLCS3vgVJc=;
        b=RQ1J3goQmcwgC9DgUnbkdajM2+YzCYLepfUe1C68WJm0zEFzZVs+q3MephY6wACnbj
         nwnJBR0grWt48SwydZXhxys5RDLOzNgeJ2H9xR644E0MYHZOU/Z08ttxQ9igR1DLuBC6
         U61UOJc/9QRGiMDUXnpQgWpXm3dUTmyugs+VUTgqDly5qxo9wW5ww7+ojTppS9xLQyDu
         L7/Qr+Hp+vqqcQ2YvVKOP+wHB5DM3zKdeKhrVpFIO96frmCBzDJA7kUR1qrvIW1cx6LU
         OBJ+XRpmuIUx2tkZzavK5S5i/YCCOYA9mY0byFKgSWzyqSMgBRZMKG7lhPX6ff0BfujF
         +/vg==
X-Forwarded-Encrypted: i=1; AJvYcCUe5rFmTYhk1dCO2dndVwvdQ1nmdKgQDcw4YD+BzFgo9B0j/vkLvOPAheYCD3VPcW47d0i3Cs2/+BGjRNk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxWyIYj3zj1tgy0YDW44CAv8aakFYKaFXe7CIDOxroOCLQqb451
	aaKclB+vxgrvHeCNd/rHHAFWNO7eUqr9/QAeX+NGD5NPS8u+zuS7/ykO4Hhb6+LRRhnvGRxekcf
	F1nfo20xwS6OcCLHYho1gmNv39FK03Arly/uA
X-Gm-Gg: ASbGncvdtvsH1o13AOH/Il6HvOqA7oAa1fZ0SgipsuZlsHodJZs51kq1t9Hc8sjcTU3
	xGRWVWEHr1I/lBf7egffqk7STSamDDA0xb0l3EO6qkd97kNKlPg6UBfAHng==
X-Google-Smtp-Source: AGHT+IFox3Wq6T2Q1LkJY3chOYmzivx2kH9F9FcDQQB+5OTyAW6yTDkFUkoBaDF4bv6wxemMWtOFwRRbrsjFXYyZSpM=
X-Received: by 2002:a05:6512:10d3:b0:536:88d0:420d with SMTP id
 2adb3069b0e04-53d99ee6dd5mr105722e87.6.1731360095424; Mon, 11 Nov 2024
 13:21:35 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240812181225.1360970-1-peterx@redhat.com>
In-Reply-To: <20240812181225.1360970-1-peterx@redhat.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 11 Nov 2024 22:20:59 +0100
Message-ID: <CAG48ez0NNph0Zp2aZ+c1T+U940CvwxcQ+jyEhp3KYZLSWPSrNw@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] mm/mprotect: Fix dax puds
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	"Kirill A . Shutemov" <kirill@shutemov.name>, Nicholas Piggin <npiggin@gmail.com>, 
	David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, James Houghton <jthoughton@google.com>, 
	Huang Ying <ying.huang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Hugh Dickins <hughd@google.com>, Borislav Petkov <bp@alien8.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Rik van Riel <riel@surriel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Mel Gorman <mgorman@techsingularity.net>, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Aug 12, 2024 at 8:12=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote:
> Dax supports pud pages for a while, but mprotect on puds was missing sinc=
e
> the start.  This series tries to fix that by providing pud handling in
> mprotect().  The goal is to add more types of pud mappings like hugetlb o=
r
> pfnmaps.  This series paves way for it by fixing known pud entries.

Do people actually use hardware where they can use PUD THP mappings
for DAX? I thought that was just some esoteric feature that isn't
actually usable on almost any system.
Was I wrong about that?

I think another example that probably doesn't play entirely nice with
PUD THP mappings is mremap()'s move_page_tables(). If
dax_get_unmapped_area() allows creating a VMA at an unaligned start
address (which I think it does?), move_page_tables() can probably end
up copying from an aligned address mapped with a huge PUD entry to an
unaligned address that needs to be mapped at the PTE level, and I
think that will probably cause it to call into get_old_pmd() while a
huge PUD entry is still present, which will probably get us a
pud_bad() error or such?

