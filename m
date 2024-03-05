Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD13871437
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 04:26:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K6KKfWDG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K6KKfWDG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpgvF4PlBz3d4F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 14:26:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K6KKfWDG;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K6KKfWDG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpgtX4G7Fz3cgJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 14:25:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709609120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXTTezTItt5z2XMw6Q17X/iZd/LoWGe+NHrzVPyEt0Q=;
	b=K6KKfWDGkKObITOikS/Ah9Kfh6yBUb3ZhIW0v7QAhLuEYrAgS3IvnwjM1YClzkLS2su/S7
	cDe9chR/WXmss0pVMIJ5eBz/81qC1wAjxphW3a6gnAHZBekd+cXpu0EE+pnCRE+JEuv0KP
	/H2bz1QdxGHzZbMmFm0RGGRQk4qBEjk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709609120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXTTezTItt5z2XMw6Q17X/iZd/LoWGe+NHrzVPyEt0Q=;
	b=K6KKfWDGkKObITOikS/Ah9Kfh6yBUb3ZhIW0v7QAhLuEYrAgS3IvnwjM1YClzkLS2su/S7
	cDe9chR/WXmss0pVMIJ5eBz/81qC1wAjxphW3a6gnAHZBekd+cXpu0EE+pnCRE+JEuv0KP
	/H2bz1QdxGHzZbMmFm0RGGRQk4qBEjk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-N_8QIwxpOSS_v9sJ3q0ASw-1; Mon, 04 Mar 2024 22:25:18 -0500
X-MC-Unique: N_8QIwxpOSS_v9sJ3q0ASw-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1dc2d4c7310so10424215ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 19:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709609118; x=1710213918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXTTezTItt5z2XMw6Q17X/iZd/LoWGe+NHrzVPyEt0Q=;
        b=IFYh3gkAmTeEYc/X+c5FzWFQoEXR/OffrA8UcMXHeach9DKJao4uRjxwRezJLi5+tL
         1Jd84k6PTntjNPcuAZFTM7JlWDhYeaZlUZcCGfJ5mUbtIHs7KUyG94zvEECTH9GH9SN5
         hUDC6QW7WLNgAQZ4N2SDSGoHI1x9FbBd5LlE7coZoJ1n2M78ygtwuRGlwCtQZkhwqpsD
         DVytdZD+/3mBUJM/81mraRxKpPTfb9iagz+nCm781UF9WFidooects7vuyBLgBVVMdIs
         CQl9kP9Qqpe1bGWbUYQYznzlOtSuS7vbhRC+a0IuxLey5teuHZoOZZzWijub+9x5XB9n
         ChsA==
X-Forwarded-Encrypted: i=1; AJvYcCVvL069sK3QVajldQt5hyPG/MdbCPXT9iwQrvx0j0z/x9So2nGFxzX9mSKQBcXKxkXvt0z51fep1fUniW7UONlrMpklUrPOppNNBgr26Q==
X-Gm-Message-State: AOJu0Yznd66+x7W8TMrxZiU4PicILZzkvr1p1ispKQHnvdRFTRowW3dS
	Mgey1/mkUGeu5so6hyDU2ZDwEGBJFyRaWXhV8amnMBPQk3fDMRLhzLok8w30z0fz/JVfwP8wYin
	U8eNhEB7+j6MBTthP8YRsImeaIiAp76rRpoDdQc30rh2KB+ZOWYGpzi2Rg2F8syE=
X-Received: by 2002:a17:902:c246:b0:1db:94a9:f9f0 with SMTP id 6-20020a170902c24600b001db94a9f9f0mr11472348plg.2.1709609117810;
        Mon, 04 Mar 2024 19:25:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIT6J3aH98CJa99vypNuCkuIr31GHtAWR9nzM3gesoAnf9BMJ50CuNlEcikNQPLHQwQIsAoQ==
X-Received: by 2002:a17:902:c246:b0:1db:94a9:f9f0 with SMTP id 6-20020a170902c24600b001db94a9f9f0mr11472335plg.2.1709609117503;
        Mon, 04 Mar 2024 19:25:17 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id p1-20020a170902e74100b001dd0a41447fsm3620111plf.233.2024.03.04.19.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 19:25:17 -0800 (PST)
Date: Tue, 5 Mar 2024 11:25:08 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 4/7] mm/x86: Drop two unnecessary pud_leaf()
 definitions
Message-ID: <ZeaQlORIX26dRQuF@x1n>
References: <20240229084258.599774-1-peterx@redhat.com>
 <20240229084258.599774-5-peterx@redhat.com>
 <20240304130334.GR9179@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240304130334.GR9179@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: x86@kernel.org, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 04, 2024 at 09:03:34AM -0400, Jason Gunthorpe wrote:
> On Thu, Feb 29, 2024 at 04:42:55PM +0800, peterx@redhat.com wrote:
> > From: Peter Xu <peterx@redhat.com>
> > 
> > pud_leaf() has a fallback macro defined in include/linux/pgtable.h already.
> > Drop the extra two for x86.
> > 
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: x86@kernel.org
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  arch/x86/include/asm/pgtable.h      | 1 -
> >  include/asm-generic/pgtable-nopmd.h | 1 -
> >  2 files changed, 2 deletions(-)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> > @@ -31,7 +31,6 @@ static inline int pud_none(pud_t pud)		{ return 0; }
> >  static inline int pud_bad(pud_t pud)		{ return 0; }
> >  static inline int pud_present(pud_t pud)	{ return 1; }
> >  static inline int pud_user(pud_t pud)		{ return 0; }
> > -static inline int pud_leaf(pud_t pud)		{ return 0; }
> 
> It would be nice to have a final patch making the signatures
> consistent on all the arch inlines, it should return bool not int.

Makes sense, will do, thanks.

-- 
Peter Xu

