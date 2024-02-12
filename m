Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B64EA851E12
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 20:45:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=DPWyE+FE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYZgJ4sLqz3dX3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 06:45:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=DPWyE+FE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYZfZ3sKmz3cGb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 06:44:37 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e09a890341so1428603b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 11:44:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707767074; x=1708371874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FvPZ2Ml+uoIOAYYcFOueab5OR3zuP4CSL4jW9UY/oxQ=;
        b=Pt4t9rnihwIy9VcMyk3MJpNq+4JWpGHoyJYkOBlXAuCevKx//FZmAc1Ow1GI0jwXwk
         fMpYwS8BCJ24D/T15XqoQ68xy2txSezYasIgZHyIdhKyYZ5Zmc4AthIb9j1s2A8Y7PX+
         JJfpvWk9p/zoZQo9UqA1BmkQx5Ck796hFqQqyq97JBCbe/ftYTgOwoTJkynjZ3G8ihKc
         rkfAbsb3eQXGMPxfjB3WRXvsrFZNoJyZnaBYFfEl5a1p+oT7plH6vGbAble3uaUWujXq
         SIiK5Oj9EMOocuWqo+K9YmD/KP/3lJ36RUR6YsbArHiYVT6keJsmpcn6VZvgCQJ2JC63
         10Cw==
X-Gm-Message-State: AOJu0YwKBU0L6Xb6O40vxnVaSuX2KFWwSuNDC0foGDsvuziVcw+N0XB1
	lrk3lcTZgZsrDSKroJ+GLENRfl71kdp51jmRNDXGeg7O/PjADPH8
X-Google-Smtp-Source: AGHT+IExLDeu3uIps4ittpz27fGovv/noGrlkq30qco/QggkpI+1lGcioSJgXHTUiOwnm6Lo+wuz6w==
X-Received: by 2002:a05:6a21:1789:b0:19f:c0d3:43d9 with SMTP id nx9-20020a056a21178900b0019fc0d343d9mr3084325pzb.37.1707767074000;
        Mon, 12 Feb 2024 11:44:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0cLlpxWEL157wC0tyhvqlvVRxw2HToFI4lHyJ0rsfBlU+cEaiJv/0SSwPg1CGsVabrR5RdqGAQ2Y/3JwGB7njQtri0h0hoIVAFZ008rPRKc2zOKZ3OQiVYp9whJtRtghZ4Ahcz2q427Uo+RM9j87h5QO3qYcR5fSGzXKjv09OF0ehjp/rjZIOHxPOpVODbdskdBhMxZ2yc9X1D72+fGIfzZhRFTza+yzLwOVK0vnax39MdXwYQHjx5MkQBMMCyf6KSfca+NgZQPDCOQQf
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id fa12-20020a056a002d0c00b006e0f6e6c014sm64596pfb.84.2024.02.12.11.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 11:44:33 -0800 (PST)
Date: Mon, 12 Feb 2024 16:45:10 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707767072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FvPZ2Ml+uoIOAYYcFOueab5OR3zuP4CSL4jW9UY/oxQ=;
	b=DPWyE+FEI/9yFMRKXRojvK5OWV31gxFCw/b2sibBdY/T1GYsGQbaIplSQMhQMvOU4a9270
	JG9qjhGSle1Dz6n1UlvF+xb+kv/WgY99iiOurbuGlDCxwVagunkYU25HDOARZy3Nia8QVc
	9PfUokm18krdiTYK0+kKa74uU0+nBEJHPMAUirrqbciwBqKoKTnL8rm8AmHeTfntnvNbEZ
	Lc4hA6cL37ap4i0NBURQg4ckYdoJE1jFoAGd19EwRI44PmMTiFaV5FbnmltFiWD+JH1Pan
	cdBFWb7+x96mPsPFy1C3zla3yGaOo+vCr5wShqpgv6yLZhdaAnw9TIA2C82fng==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH 0/4] powerpc: struct bus_type cleanup
Message-ID: <hzkhylt7euhqdofum2otxckc24wj2qzjuuqk3ufncfg2yb5bbg@oabi6h43zt33>
References: <20240209-bus_cleanup-powerpc2-v1-0-79a56dcaebb1@marliere.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240209-bus_cleanup-powerpc2-v1-0-79a56dcaebb1@marliere.net>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Please disregard this series, I will send a v2.

Thank you,
-	Ricardo.


