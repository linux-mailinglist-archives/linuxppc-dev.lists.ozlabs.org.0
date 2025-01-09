Return-Path: <linuxppc-dev+bounces-4903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F64A07045
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 09:46:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTJKz4846z3bVW;
	Thu,  9 Jan 2025 19:46:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736412391;
	cv=none; b=nGwYe+SjaKy6Mt/TpajY0CqUPjUrnTnnfYDJhw82vPBcDua5dnfLtpg2ZfJjd1+/eTl9rMLpZqlXfqNV0F8fjAhq8gi5qIt8Mi/qJh+4ru45k09QDs2W240cHDHS/7oUjO4nbo6bfEUpLbXiS5yKDVebIsjs+EdVkoxvSO/N58elVtvEp5jitDL2+uTKWAozItcmMwTjfUyf6jH9Br4Bqap5tU/OJ8lCeGmTDSmkS9vDXfwY48IUwwpF/WSHfJXHu/61Ibp0kofN/eyxzh6vqu84/pHJSYDKiKHVEdiSzWZ20PG6ya8w+PMN62QDMM6BaFLu1147JvqShIl7LcKvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736412391; c=relaxed/relaxed;
	bh=aT6h16XRgOZytfcOtsHfB55s6clvjsMb3AN4nmtAEpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPKOHgrw2BL/e8twPb0sbguJ5uD1vHKQMqp7MqKqI1JQCPaiM4kCffH7E/ptTn2CQ4j/aoQEgyIWFJ7ZdrdSgpW9ttRK30vAyMyWK8a5PI+y3WMZx09VGXapbcKFKEXcv1XyKYAJrSyZ5qgNgCnE2Pkx5jWN0WUWYUZmA1aQaKj0q7SK7tgHrekpA1ZQA47aOkaFK1gtUa60y3SguNtu7NcvB93BULxKp7ZxBsTpjehCtrMn0jlFVJR4obPzwIBqPJKsnyf3BoCbsiPOsUu+Tkq89iqHh8BV46R/xIi9RvOeISFTIw8KW/HHBOKrwDkY2y+FJF7YL8cFmyKTk1RI6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=c2lV5Z/D; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=c2lV5Z/D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTJKy0dJYz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 19:46:28 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436281c8a38so4820125e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2025 00:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736412379; x=1737017179; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aT6h16XRgOZytfcOtsHfB55s6clvjsMb3AN4nmtAEpg=;
        b=c2lV5Z/DGYZwBMt7xG6nkmEfAHai5OahQfgiEAvoEv/8iwbGdjOjECsGrf0m5EFm7b
         dEqt98s8uxCn6byLB54/TaHMtRAdWcX07v5NDDmftwik7Aiav5irmNMx/dTxM2IaIXeb
         /Q+/ZhVjDeLJBemg6BjN4RtihunIQLilDY0RH+JGh6BIWva2MwsHn+aGgA/tx34xa4q0
         uQtdsTYD94ZWvMHsyBGZ5B08O7/7KRC+gCmV74lbQrBwvOVsYYm4FQ7I9G5vMrtEVce1
         Kw4OBZBcYxvFkgncH+V0FefsL5EJpNSZ3c39KaYHMoHekhnSbdF5uQl7pWjI3W3VrGdw
         66Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736412379; x=1737017179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT6h16XRgOZytfcOtsHfB55s6clvjsMb3AN4nmtAEpg=;
        b=AyQTeeBDSfTWcLw6qk3R3wi2qEOgNOBOyJWSipz8wIyAcQxiSSr75KjvLV++f/A/AK
         6qtLugeFecG1SscPAGvDzX0Cs31SpmvQek/628WJk/TsUOcvNZYXtPqRlYm1hls/ELQs
         IBmLnyN+7m11QWpWeKBKC/sIV8dbzFaEjyayJEVnTCzKeSf+alSuu6VeHbJnPjDIWsgX
         L2QfMtTlVPaYZl7mIFtvIwbWv5BETuTIZuDxH2/tUG3f/8gJHYtZqEIa2WZzeVRlf42e
         cw9SJXyaiwh22uH4KKIZquKwHiw2T/+y8JC++nXSTwrBS0orHHEepS0T9lOGAckogjBq
         Iucg==
X-Forwarded-Encrypted: i=1; AJvYcCWMk5dX0LxXS6vU518bxaLc+980uW94QuOGAH+C+7L/x3vN0Z7Rz3JBOpR9ckkD99T//3OFC2V/gjnlpqk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzZJ5b35GI/mTiYLs+NAmbMy4mc5NtmFQ7Jea8fPDKgszACYCkC
	0pPXUQJIzNlrgUJJ3M5x40HLZQluINXFoVoc9EAdDVKgpbKSRdNi/ShC/kwg8AE=
X-Gm-Gg: ASbGncs8mbM85fhrXh5eWuTEQL977yUOCCn47FsR7TTSV9Xvn80YnXOjtOgYTqGDCEU
	Eg9uE7iiqmz7FQRt0RT9dsPJgSlmpreUTn9CSt/8foFTqmprCFe9A7rd54gtZtUNdy5msdYiO+2
	XIFOqxCecONNBM0xYgS9CR3W2bzWY5GeaDb81j23PPLndcnTwWbQbvTyHbdo3Rrz5HBhlJWqW5J
	U69mhu4iNO8foAQ1NgZaQF1ji3Y8a+6UCMfW/USVBJ29SU=
X-Google-Smtp-Source: AGHT+IGSdbhxVCHDC3vLUUMrjAIP9JM4UG/RcKQTMKms3Xt2J5RXb7IyeybxZB64334rg0W1LTjhbQ==
X-Received: by 2002:a05:6000:1849:b0:386:2ebe:7ae2 with SMTP id ffacd0b85a97d-38a8733df9emr5690120f8f.45.1736412378954;
        Thu, 09 Jan 2025 00:46:18 -0800 (PST)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d007sm1174655f8f.20.2025.01.09.00.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 00:46:18 -0800 (PST)
Date: Thu, 9 Jan 2025 09:46:18 +0100
From: Michal Hocko <mhocko@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Nysal Jan K.A." <nysal@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linuxppc-dev@lists.ozlabs.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] sched/membarrier: Fix redundant load of
 membarrier_state
Message-ID: <Z3-M2pVQHCqWZhZy@tiehlicka>
References: <20241007053936.833392-1-nysal@linux.ibm.com>
 <20241029055133.121418-1-nysal@linux.ibm.com>
 <ZzsDEvJn-vauz9gE@tiehlicka>
 <20241118092517.GE39245@noisy.programming.kicks-ass.net>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118092517.GE39245@noisy.programming.kicks-ass.net>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon 18-11-24 10:25:17, Peter Zijlstra wrote:
> On Mon, Nov 18, 2024 at 10:04:18AM +0100, Michal Hocko wrote:
> > I do not see this patch staged in any tree (e.g. linux-next). Is this on
> > its way to be merged?
> 
> I only now found it -- it doesn't look super urgent. I'll get it into a
> git tree after -rc1.

I cannot seem to be able to find it in linux-next. Which tree is this
sitting in?

Thanks!
-- 
Michal Hocko
SUSE Labs

