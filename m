Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B8D71118F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 19:01:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRvTr1FGqz3fCc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 03:01:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VEXX4D+/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VEXX4D+/;
	dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRvSm2wt4z3f7D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 03:00:39 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-ba86ec8047bso1164564276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685034035; x=1687626035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHrTsqL0nqeqxBvVw7n3mE3d9UFJpL2j8If6jZFByTc=;
        b=VEXX4D+/ehgygAWm5BmRxKMQVayX+huiD86BmHpUJbQZIavyZk8MqgFgBVJCgltW8G
         DGf1XLm8HhYD7C5Ltu5hncRV4xkFiRLvjnKAKUZAVqhHyZU7uDae6IK3C5qSD3GFgpGy
         OqLSmV63QlFHc9BLqOH+z3/46t/qsNvryv2gOmzRQJTarAzeFF3wkmaawd/u1vYzudf+
         2OoFyE7ArYkSpPwfiPG4wUCBT5egkmxxlXwXAVhzZYomT8xAIzGjfTrChNVAlbK2FaKO
         3t03QrSsNM3MzVGbAgb9jEqdKkZ/GGbY36ZIzPCKupNWpFQuCEQc+t41/FAd5d9jW5uu
         ry0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685034035; x=1687626035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHrTsqL0nqeqxBvVw7n3mE3d9UFJpL2j8If6jZFByTc=;
        b=eHxJOqxQDJJUSQLSEYFadKjvDB+igWtdvonSX3NSfteVzZWWNx2PObOgnkVk0dqUNq
         GyzZNVIu/etlQa+WROeNk3iS9rrgZi72gFnJc1OqdGUw8nGBaUUR0uLXwAiowxBQxP9j
         jaVx8KF94pS7b7MnYjjG0YUVGGLl5FvvIzno8xAIrKfZNNgeQxhD0u4qXEaDAcVYHaHA
         Lka2teLgyN+mjlwVtPosAg0o5UOiMEqjceJa2Thm/iV/vvWXshtfwjsiwODpiUDuhcAK
         agaqh8srnYNB2EbATeLccKaxY4ddDcSXnE3ZRYCD+NOALDY7phZtLnNdfEBNeYOY+7QQ
         s+vw==
X-Gm-Message-State: AC+VfDze+mWLcM6fQbqd/0DujyPlwXKmloihBk0otjilv6S6l0OBfeWQ
	cqbxJD92Xv2SYtAYLdYGILtSKpHX/urjOc5SeKc=
X-Google-Smtp-Source: ACHHUZ47ymCJWriUjad8DQ05hIMcCKin/PTMMU7nNv3HHwEyV9e0xB3DhHdcf1Fkkg8cgW7lAUtL7p6ayG4dp+Ur5MI=
X-Received: by 2002:a25:2487:0:b0:ba8:5ded:13f3 with SMTP id
 k129-20020a252487000000b00ba85ded13f3mr4152229ybk.17.1685034034679; Thu, 25
 May 2023 10:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com> <20230525085555.GV4967@kernel.org>
In-Reply-To: <20230525085555.GV4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 10:00:23 -0700
Message-ID: <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
To: Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 25, 2023 at 1:56=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> Hi,
>
> On Mon, May 01, 2023 at 12:27:56PM -0700, Vishal Moola (Oracle) wrote:
> > No folio equivalents for page type operations have been defined, so
> > define them for later folio conversions.
>
> Can you please elaborate why would we need folios for page table descript=
ors?

Thanks for the review!

These macros are for callers that care about the page type, i.e. Table and
Buddy. Aside from accounting for those cases, the page tables don't use fol=
ios.
These are more for the cleanliness of those callers.
