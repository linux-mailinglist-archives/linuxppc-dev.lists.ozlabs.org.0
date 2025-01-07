Return-Path: <linuxppc-dev+bounces-4763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDE2A03D1D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 11:59:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS7Mm6rPwz3Wtr;
	Tue,  7 Jan 2025 21:59:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736247540;
	cv=none; b=Sts5Tch8D5rjY0cZbcuUmrIK4tYPJZ53+tQir34tvLrwTRvyioXH9NNZeN/mgALRigtLRLIcnWuiDEb34OgAGICaPjN3R9bOQYmSq1japNcbqTMXM67Hi/ZZgAvhk4UYOZV7+tfby2bxZ1CsUF+asJsp7y6SxXoNtGGJ7HjoKKHjqJUQBmgdKD3KRmv/LZpOD17dhM/CNRsNaTO7VvOydGSwsE07dwAF5GiqjSkmD6e/SUVd0t5MMFfI0d43lI3lhFGo2U3yCC1SDiAocPEqoQawd+xYK7vmxlXP1kyunsxZPRrWVmpenQK/jXsb+hx8ZZmsh5mXSoplQoqR20dFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736247540; c=relaxed/relaxed;
	bh=VfvNApDEnkYxo9wayRnoayueQp1chw+vILiOzbCROK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWOMMU/zX9TC1g350b/13oohw7fEE/yWZxMcsppO7POHDbkx41zm0OAlzJBwyib1RJopDCTijJRIwsUt5gKkFLFtKAL9woxmz2r2/flTXa5BY/l8qmpqs232sn6kbSznfdawLFKYB0eMixl1L1is6Vrauph8Mi4Am4NVIS9hq+IqxemaxLiyziEviiqiPNwzevXyiCNqcDusK98vXahl4UADBgh4p4If3tVc9j7e2DCxUmnxkW8EgPjvpN9WonZexh3C/JyT7oVVVKgAzVEw+COJ9/OjyKg7vgPcAuEWYJNUS3C2Lq517ap2NXG6ndzBJWIH4VyaKfAfDb2P7QfRBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BIWrxTE/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BIWrxTE/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS7Mh1pQFz30j0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 21:58:54 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2164b1f05caso219180185ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 02:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736247531; x=1736852331; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VfvNApDEnkYxo9wayRnoayueQp1chw+vILiOzbCROK8=;
        b=BIWrxTE/LIrY//Od3V06tszr3tW54uOeLhlWdtspP2Cyc6hU9XhLccn4BR+j9tIdXI
         VZiJWl5/cgYEy254JEJA5USvUGGAmXBx3vz4xPWjtR+bNrM4p0tJGiMRn+k3VrVmafSq
         pRLygmga+SL66JXaNGyjd6UKAE8R3AL+XLFaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736247531; x=1736852331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfvNApDEnkYxo9wayRnoayueQp1chw+vILiOzbCROK8=;
        b=UJET3+7Rh8WK2uly+GsKmbe++hpYvNEV7Dbtjq57KnzfwKmrptSs4HJGR7Pq//b/10
         VGN9Y4w6abdvYAOGSo4Ow9I0xIvNH+ErOei3zBdOFukx1XKu8QYNfh8eOeoPe9TD9IeB
         lSutCN+OwzHuAOfC0bPtIEZQD7y7wgc8rXhgb4T391rKswm+PuOB8NA+Vrog+08MS+W/
         RPWwnXQFPJcrgkv4jn5SkqM9endZq+AUFBBTmCCUufOm7qjmDnIEZ9KeN7AZdp//YsFu
         AOhARxugP9Xn4QFk2mwgnLMUYe2DMMk3t4qprasVVAyGHxkaeKDMwWOVM1Ldt7/Nxqwo
         wJsg==
X-Forwarded-Encrypted: i=1; AJvYcCXoqiGYBo34YDvK7mFbCVuswzjC2Fh4dF8OgnuZQnY9sEQZ85wW/EGrADktxyxhG01EDXLGZRoCisyYy/I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxR6ZXVQXhlI8+JFdfUPoFIyAO7Aotg0aHYDMt2Rj2MUwt8N0GI
	AYLNPhJIk/HEhPh00j3w0zY3dFbpUlxx3eYYu6U4Cjk3dUxUVXzTHDYOdZXfHg==
X-Gm-Gg: ASbGnctLMRdhQz/KNP4IWt6a5zVhrgdqVhZyUu6u1pmLk+akw1PACHuJGnrTzq6tb6R
	gF7mNS1itrKeCzJ+0nFSby7sGpWi5lBEEokZ9+cUS7yNblPfxg2m1WOxTqbRWIeBL8HvGfcw7S7
	bF4IdF59POIV+LWb+NlrugEAD28K3PCZsoP1wUl/rDQ0Rvv7v7QN8ki3ugk38As2dQbsdvBlA9r
	tuHXwUL+L7Yoq6kLJUKcgvXE0WcdA5MZRLpl9Fk/Ht4F10AiEjcM78yuEYM
X-Google-Smtp-Source: AGHT+IGNgNCUH8eyQMCUvASISKoR6AY1tcPkTy+eXP5eG0bm252IvAUcQpZz2kuI6Vj2Y7ykEyzoAA==
X-Received: by 2002:a05:6a00:35c3:b0:726:64a5:5f67 with SMTP id d2e1a72fcca58-72abde09893mr87978739b3a.12.1736247531428;
        Tue, 07 Jan 2025 02:58:51 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:c142:c1e8:32c2:942a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad84eb34sm33168531b3a.87.2025.01.07.02.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 02:58:51 -0800 (PST)
Date: Tue, 7 Jan 2025 19:58:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Daniel Gomez <da.gomez@samsung.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 01/28] module: Extend the preempt disabled section in
 dereference_symbol_descriptor().
Message-ID: <kknhqunwsiumn2dkdhnc43ecuzdvqa7zws553gnocnksz5vl36@jllfly2mjegz>
References: <20241220174731.514432-1-bigeasy@linutronix.de>
 <20241220174731.514432-2-bigeasy@linutronix.de>
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
In-Reply-To: <20241220174731.514432-2-bigeasy@linutronix.de>
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On (24/12/20 18:41), Sebastian Andrzej Siewior wrote:
> dereference_symbol_descriptor() needs to obtain the module pointer
> belonging to pointer in order to resolve that pointer.
> The returned mod pointer is obtained under RCU-sched/ preempt_disable()
> guarantees and needs to be used within this section to ensure that the
> module is not removed in the meantime.
> 
> Extend the preempt_disable() section to also cover
> dereference_module_function_descriptor().
> 
> Fixes: 04b8eb7a4ccd9 ("symbol lookup: introduce dereference_symbol_descriptor()")
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

FWIW
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

