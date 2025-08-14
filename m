Return-Path: <linuxppc-dev+bounces-10967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDA6B25882
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 02:43:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2RLN1pV0z30Tf;
	Thu, 14 Aug 2025 10:43:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755132204;
	cv=none; b=SUCdRMfXGprFJt8+1gzLAPVNwFSorhWIWnQ1voW+76gg0gbhf8+Wr0JvFOc0mBRPPjtppqE+Q4AACfh+G59Jm9emr6IQAjnSDYdTj3nwJWO/9KeDLWcrVRNumnknBrDVVpMKIMvJX80D6/dj78Q/2rcPaDazJfuxWPE46Cud7DqSU548c/dsaITp2hgxRyjykxd6QULxD0ioeq6VUxmc5+V5zmusncf7po3Jg7eH2iIO8twvzLGuYmlOl2w4RqNJUYXIoaipA8zSPNBoRMxwLCAnwtizpINgEnUdKhARkZ8AXqgOjqJmkcrr7YC7t7N/Efxvc5H6Xd4+n6z68WnlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755132204; c=relaxed/relaxed;
	bh=u+C5FMfkso7Ehl3CDtEbjqMlL+jBCATLbsthyMiqNTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjoYU2nOIZFiKSUPd3ByyATgJb4XwDSC/B12u7SDB/Q3nBEM/ZrR09Qxwxs85YuZOrEKwnKi/UaTW3rWg1HXejf31yZSNh6wmYploYKW15avqfZ0/imuIFBj5HWMhZ6t3xVSSBwCXEyjyfqxdR+hykMsHyJoxiQVOPDQBhcN6RGkMS5pQX6j/2t+FYKiJHi8TYypHlnAo2qktOSs2Kd9bYV0kKCgSd0eycpSN7n4tUpQiTrFwn/OSb4gSwNYw9tmpSJUpWQheF8+GJ7JBHEaPQf2MuUOfmn+UmrkLxePrG2Fb741xhxietLI9xlvaJ+R5MlHzaq9EASpomSTHJcIxw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HHqEsrlI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HHqEsrlI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2RLM2qxhz30Sy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 10:43:22 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b47174c3817so207292a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 17:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755132200; x=1755737000; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u+C5FMfkso7Ehl3CDtEbjqMlL+jBCATLbsthyMiqNTA=;
        b=HHqEsrlISca+Wnkd8KOq5CQoaGqDhu7ynOY9ObB6U6qZyg+x8/xpXMLsq/eyqSyT3H
         HeK39B0gmsbBBYhIi6YRepTHXJMivPW+GHPt+YFbige7rXIy3pbtmxCv5I+V8FQWHnFR
         NFHBGr3GaxLzZIPufXuglVTGPkRacoSmUZ189EU9eF8W10x+IIA8sBBx4s4VaOM7sRUt
         PnSd9EsPB9haahpgJ9IesedL5to8hCEkd1hU+I9QO+5sT7lWlJ5aRVGpxdgts2xD8EFg
         xkxlL7UM9XEBoNpJVcIhFd+DzSgEbv8FROsm+TnCDrHaCdSO8GwZ7sXRvRbdQy/1BqZd
         hvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755132200; x=1755737000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+C5FMfkso7Ehl3CDtEbjqMlL+jBCATLbsthyMiqNTA=;
        b=kL2xq3gIrsca564s9UDA3+eLndgrCdrfK2BB/g6LHEzUuKJwd74II/fuozXk9ozu45
         cHZdiilO8iTg65eZg2EWfphqclfvA4wv7gYQ5ae8IDgBwKUUkmEcz6s+3Tpi83Za7NOc
         5S9TklJJMa3OeJCbMlFY0hU9E6Q2fsmaYK6oUuUdbXZsh2hAwT62Ff7ZrPEtGSryvQ9j
         ncEhncEvy57FUyoOksu5+GMVXskVfmcFJ/eUYSZ5tuGUpkQzHaxnZINALIRxtf1nnqRS
         cezf6xliZUOVbE9B49zVUoULVUO68EgUeOPQYzpN2JFtmUK271TQXsDLSDM7pXKT2LGi
         OLpg==
X-Forwarded-Encrypted: i=1; AJvYcCUtYfMtAHaC+ZLoksDY1+QfrYQFR93CKhoPbpYb5lCikY16/GmohheU9lR9pqikLNZl9hCZx88+9PEIQPw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyK9IaGrHA1CBGL/xjOmWzdcQ6ythJxoHQZZH+d6j9aFnhYD2EX
	sx+qadOAvuar8m/d4vP62i/2frYaLNqKTXIHpc32EHWwSeOQd2TCzKI5
X-Gm-Gg: ASbGncsAe+E7bP635KLLZ8aWg73z+D4karljUFi8ZXFcKgZaSqKy21bDspJQaDlR2C9
	mlw+s7nJOFqEwjPt9aMyx9h+xNJfaT5vALNm0KLsC5cDc7ugc2mMEv7D1wvrjchmbtdlc1A2RTL
	u/MaYWK9vSVoqiHs8VKiT6Tt6VNIhFAPP4PoPNqzWzIKCNEUGN6OUbrJpDdTLSdjpa5oMReuI6g
	Gk6OvNs+HDJaRLtOWYbiTzolpBsN8MIktdDxrCvhoe5ZpDglV2bYKn4/4fXjWiF4aq8Z0T6GQg7
	7MOd9tgj59WpcsxkRZ8mcq5/qd2qUOparHhCaZyWK56SF/lCMz+WYM1OutFrN7ffzE4t6EISVRD
	Akp3FDdnYnFz7JzpP/nbTqw==
X-Google-Smtp-Source: AGHT+IEiVLFQ5wPPcPeCPkCFJiPIhTF+L2wnLKcVZ8kQ7OVLRd1oTgrhJtB0ONkLIOLfiAtQofJh5Q==
X-Received: by 2002:a17:902:f602:b0:23f:d903:d867 with SMTP id d9443c01a7336-2445868b44amr13421015ad.35.1755132199683;
        Wed, 13 Aug 2025 17:43:19 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2438de0a660sm22394765ad.164.2025.08.13.17.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 17:43:19 -0700 (PDT)
Date: Wed, 13 Aug 2025 20:43:17 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] powerpc: pci-ioda: use bitmap_alloc() in
 pnv_ioda_pick_m64_pe()
Message-ID: <aJ0xJenyDJcZILt-@yury>
References: <20250811165130.37552-1-yury.norov@gmail.com>
 <20250811165130.37552-2-yury.norov@gmail.com>
 <b1fe7008d2f230dd89be6d2541b7cf07ed2514e3.camel@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1fe7008d2f230dd89be6d2541b7cf07ed2514e3.camel@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 12, 2025 at 11:07:08AM +1000, Andrew Donnellan wrote:
> On Mon, 2025-08-11 at 12:51 -0400, Yury Norov wrote:
> 
> > -	/* Allocate bitmap */
> > -	size = ALIGN(phb->ioda.total_pe_num / 8, sizeof(unsigned long));
> > -	pe_alloc = kzalloc(size, GFP_KERNEL);
> > +	pe_alloc = bitmap_alloc(phb->ioda.total_pe_num, GFP_KERNEL);
> 
> I haven't checked whether or not this has practical impact given what we later
> do with the bitmap - does this need to be bitmap_zalloc() to match the existing
> use of kzalloc()?

That's fair. I'll send v3 with bitmap_zalloc().

