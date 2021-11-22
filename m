Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F12459640
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 21:48:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyfVd4Yxbz303H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 07:48:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JneIEC9c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=JneIEC9c; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyfTz3xrRz2yV5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 07:47:33 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 gb13-20020a17090b060d00b001a674e2c4a8so929534pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 12:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9FObduEZbWdjUpMXz60aZqufbQdzvSRG3lPMBJb7SJ0=;
 b=JneIEC9cvLJCbdtDu2vtG7jOReTI8ksmr7YGpy14cmKopDG1WNnzN9vyEAQ5ZFY1Ll
 wLrz0I8fq9UmpvvAfe8h8Dm9aKo2h0iPbnV+aXW1yLKcF9165JU7Nw0SLTEFehyBU+vN
 6QUq5HYvX2wTw8c3Eu9q6Z+6Y1Ty/R6fmPa7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9FObduEZbWdjUpMXz60aZqufbQdzvSRG3lPMBJb7SJ0=;
 b=cbKXcLgy03wR5UyHJ5OlKLP8lEGna4M7LxoCEK5FRY2x9y7m6zPdyMJm/DmukL+6lR
 dkEPGvBLgB4c/PnmQSPCT1MuzE5wlPASZn2ShEMia1TxU2asCnEhI9XlmllGhIhbLz3B
 m+Yneee+BiMzzmHTYBYF+FDZwMH4H1I94hDcOLX3OaDsdB2R4GHUZtXnBL5ci8umXDS/
 eYzfL7X9+L8C6G+sSYRBR77gWnbjQlYbDQyWs30wigfxu7Xd7ziAURp2pcUs8r+936rT
 Nm0g+gh1sFo6NdDDdioJtAyl8G+/5TtZboxH88eMLWF+kBolGk1tPOVtiDSO9pw9P3/R
 /ihQ==
X-Gm-Message-State: AOAM531uen6RZLUr6AdlxvuvbFrIU0yr/sMaFZ6XGcqGkoQvlj3aCxTI
 DuJjfqkYQah78YnnzM+/5J6Iow==
X-Google-Smtp-Source: ABdhPJwcHprzgfWpUQCUPhpzVPFnI4WiDGxFFLzGSTeGQcOoYiccm8mTTcquO4kALyNvrKtHzcsEvw==
X-Received: by 2002:a17:90b:1c8d:: with SMTP id
 oo13mr36323110pjb.239.1637614049808; 
 Mon, 22 Nov 2021 12:47:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v10sm9796801pfu.123.2021.11.22.12.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 12:47:29 -0800 (PST)
Date: Mon, 22 Nov 2021 12:47:28 -0800
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/signal32: Use struct_group() to zero spe regs
Message-ID: <202111221247.B385EA2A8@keescook>
References: <20211118203604.1288379-1-keescook@chromium.org>
 <1e312cbd-cd52-ddce-f839-db765173c526@csgroup.eu>
 <87ilwkrbhz.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ilwkrbhz.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 22, 2021 at 04:43:36PM +1100, Michael Ellerman wrote:
> LEROY Christophe <christophe.leroy@csgroup.eu> writes:
> > Le 18/11/2021 à 21:36, Kees Cook a écrit :
> >> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> >> field bounds checking for memset(), avoid intentionally writing across
> >> neighboring fields.
> >> 
> >> Add a struct_group() for the spe registers so that memset() can correctly reason
> >> about the size:
> >> 
> >>     In function 'fortify_memset_chk',
> >>         inlined from 'restore_user_regs.part.0' at arch/powerpc/kernel/signal_32.c:539:3:
> >>     >> include/linux/fortify-string.h:195:4: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
> >>       195 |    __write_overflow_field();
> >>           |    ^~~~~~~~~~~~~~~~~~~~~~~~
> >> 
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Kees Cook <keescook@chromium.org>
> >
> > Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Thanks! Should I take this via my tree, or do you want to take it via
ppc?

-Kees

-- 
Kees Cook
