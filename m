Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C4443C04
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 04:51:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkXqs39Snz307L
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 14:51:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=U5KqNpjE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=konstantin@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=U5KqNpjE; 
 dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkRbP6g5qz2xDg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Nov 2021 10:54:55 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id bl12so657188qkb.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Nov 2021 16:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vO4VYxq+eHBQA81nhSLqjjWx4ejJxUAVva8AW+ugOmE=;
 b=U5KqNpjEoUdbE0harjvjuk7Wlf4afX5oJF/IyOrXC00KM9K81x6cMAEls2W9npMvIc
 mtSVZzpwU+17GCnCzEZN5wmZthd88Q8xjeoNLjgLHeo60bXM6ZeyG7QaqK5nCMrvpJ1+
 wnXlQPyOFCOnN5+T9ku9C42I+b7twvEynRtqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vO4VYxq+eHBQA81nhSLqjjWx4ejJxUAVva8AW+ugOmE=;
 b=lT+58L4Iz/OHr5QXfFVPWoECieA77iQZBsHbetiNAn0Qn2o0nXSETkf5peTzvFEhfr
 M+lfurrP/b16rlHory+VCMlF1fsc72fM1LmIC4JjtSQCwTRD/I5fIRWuEAAtBkrWeU8j
 XeTgRr347Mhbi+0jdhx6sUAdVyN3yQFuHJNg2jmpJS3UHDZ3g44bJ91/7bEjEPwdIPrL
 lnzBO9yyRJWsJT3PwSnx/YGBX1fShm2FnGSraZMrcCLXmDdgWEQv4wt3yqoID0JVVfFs
 JRHCIjSZe3JxFNiXkmJJ6KszlgGwJklY6byBBpwttSXSYJKLlB/K4jjv6Ye2py/4WHxx
 q/2g==
X-Gm-Message-State: AOAM533jdXvODHj+5N98cfXdEoJua1Ge4a8O6FLhG/U8mMPp9A1jFagJ
 XAJ3uTCz9h9SC6fhdvGyVMNDGw==
X-Google-Smtp-Source: ABdhPJzJxXzVTns+6QyDP8omHnk0ZTd2wBsDt10QQMCuSgPa/2MtGgPlh6hCKicu7D00A2X/6jZinw==
X-Received: by 2002:a05:620a:2585:: with SMTP id
 x5mr31299231qko.378.1635897291380; 
 Tue, 02 Nov 2021 16:54:51 -0700 (PDT)
Received: from meerkat.local
 (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
 by smtp.gmail.com with ESMTPSA id h14sm421680qth.23.2021.11.02.16.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 16:54:51 -0700 (PDT)
Date: Tue, 2 Nov 2021 19:54:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 RESEND] powerpc/audit: Convert powerpc to
 AUDIT_ARCH_COMPAT_GENERIC
Message-ID: <20211102235449.rwtbgmddkzdaodhv@meerkat.local>
References: <a4b3951d1191d4183d92a07a6097566bde60d00a.1629812058.git.christophe.leroy@csgroup.eu>
 <163584790624.1845480.1785827913484538939.b4-ty@ellerman.id.au>
 <CAHC9VhROvSQHVQ6Wo8zHND1rGm+r6dGJur69B65sJ9JwNvMDpQ@mail.gmail.com>
 <87a6im87tq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a6im87tq.fsf@mpe.ellerman.id.au>
X-Mailman-Approved-At: Wed, 03 Nov 2021 14:49:57 +1100
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
Cc: Paul Moore <paul@paul-moore.com>, patch-notifications@ellerman.id.au,
 linux-kernel@vger.kernel.org, linux-audit@redhat.com,
 Paul Mackerras <paulus@samba.org>, Eric Paris <eparis@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 03, 2021 at 10:18:57AM +1100, Michael Ellerman wrote:
> It's not in next, that notification is from the b4 thanks script, which
> didn't notice that the commit has since been reverted.

Yeah... I'm not sure how to catch that, but I'm open to suggestions.

-K
