Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A69342B846
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 09:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTk3Q6yTrz306K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 18:01:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZW1dzqTr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=ZW1dzqTr; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTk2j74Jbz3cCY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 18:01:01 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id np13so1440205pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 00:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=InasTA07olrN5RKyUCQ2QLJqu4RTKKj+4k1NAdmmjBE=;
 b=ZW1dzqTr/trhkOlzXVsWQL586M19ht5k71pAxPY8mwIv8HZ5vMO/WakCDu3Hq5RvP2
 S4kwqQ46jwWgJmegTf1B7gmFx7ZY3FN7syR3QnvQaQXNPAkDoJZz1tg9c19yZdRE/ygR
 QKkc9RMEzFZzxIH9XcekZAMGkMKRcOFulbggU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=InasTA07olrN5RKyUCQ2QLJqu4RTKKj+4k1NAdmmjBE=;
 b=FYYgQ1ZPzsTYIopeDANIDV60vD4tPxBzjeyjt0XAhKxC3yx+jwNP1OqaHacAKgfkyD
 MgGxauyXpW8qcx3chTTL4F9vZG6vwhv1PTId7U0KKmYEWFest88kllMl6J76+ve5EKwy
 EwFAHM7KDZYyYTHkVD4AE7lFDwJZnvDaKJaM/KieB8+qTHREgX/knyRfOOCtesPmnsI8
 l53RPN4NYdIrV8B1sCpA8/IbeYzPrU130MV943C9TZU3jKfoFBtaW8TOpUMrtW1S1wOD
 lls8ZqpIiLKHDoH1GD0XglFmOuPYZTPRD3FU05NVJZU4rqFqSCWAg4gH5PuoIAXVnDRW
 hOvw==
X-Gm-Message-State: AOAM531qVhtPzNnR8+OTZt9kyYjycDqzCgwPz3skPLGBQC7ZJL3+ooA9
 nGhugM31zg3fbhp11WyNxYlsww==
X-Google-Smtp-Source: ABdhPJy2g6jssV8McfoxTEnq7XQUmrF0dkkPaUlbhWhS4b/L/PDtLrRFbojWVXZaR7ZIvk9TuZJ6mw==
X-Received: by 2002:a17:90a:5d11:: with SMTP id
 s17mr11474193pji.230.1634108459798; 
 Wed, 13 Oct 2021 00:00:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m22sm13288608pfo.176.2021.10.13.00.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 00:00:59 -0700 (PDT)
Date: Wed, 13 Oct 2021 00:00:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 04/10] asm-generic: Use
 HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR to define associated stubs
Message-ID: <202110122359.E59B90A@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <8db2a3ca2b26a8325c671baa3e0492914597f079.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8db2a3ca2b26a8325c671baa3e0492914597f079.1633964380.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 11, 2021 at 05:25:31PM +0200, Christophe Leroy wrote:
> Use HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR instead of 'dereference_function_descriptor'
> to know whether arch has function descriptors.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I'd mention the intentionally-empty #if/#else in the commit log, as I,
like Helge, mentally tripped over it in the review. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
