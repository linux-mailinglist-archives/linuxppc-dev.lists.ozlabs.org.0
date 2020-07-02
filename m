Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B11211740
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 02:38:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xzhk0LFNzDqVP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 10:37:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GtyRtQb2; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xzft6rFDzDqGS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 10:36:22 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id r22so24063383qke.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jul 2020 17:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=lQHf+0bVn/Xs5pc4jD6G53UgqJbz7a3lP2qgiE8LNco=;
 b=GtyRtQb25zFFlLbHaH+CWPKcfFazJsquvMrP/fkPdgNoT5FtUTuaj9gX5hY/I+zBck
 PBui18eYLlIT3gfLOTwn5wTY/HqUSIC9UoGmPMIqSBR5A/GB2489NBFh4JMhY3FQmNWC
 NGLhuLau9Ughq6VgWhpZgvY2m4w84nGEkQfQyhP8tXscmR8neZrJlfqJ2Rk8BxIHl+8e
 RhEtfBBLx8pTik/01jknPv7U8V6UueK0+K/YCnjbh5F+5NSI2R2tP3LTjbJV4tBjc5W2
 VPiQbuUBDwmj1reEylN2+dXEdjkgPNoZo3VjDXVcOoEx087wuZuGQSQhzqklFhAzdoZ2
 OCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=lQHf+0bVn/Xs5pc4jD6G53UgqJbz7a3lP2qgiE8LNco=;
 b=IUXg/e6vdFX22lE85Ps80bQKagh9IHJbTtuJbBTmM5naqOkfUTQ+d16Y/G2FA8FG+8
 UpPvypjtVQzkOxh/MiWeYrMR0Fb+/+zDN2KVSp6QEkkKSzEJzUK1zZboOk3rVvq4ba5I
 HZiMt2auqKX+rj4Gs/Pxjm3QjGzsv1zKNR1hGeNxp5h89kIC/2HVrPa17fGd7OOfOGUl
 IvP1jFWCP1rrOTW08NixmPvMJ1q1CqIV++wfuZqZneLQCpohDhRgoG2va6Qn9ijgIsjf
 i6/1CdIAJr4Tmx1qJxLrkIayuvt8l42wgYmlP5g/q0G5R7b0t2PzYqLSQWhAq8vJ5jnD
 aIsQ==
X-Gm-Message-State: AOAM531BucaJqO0zl2WrrGCrAJentZRDs6x20wWtyC8l70e3VINVbvFl
 JWmFQoeWk+62Q6XxDmL0Jko=
X-Google-Smtp-Source: ABdhPJyJBesnBNF6KAvF4epCg0RD8u1qFrRivuh4zSkLTEYTAbqn7EaQ1o97VDTuVhl4VjzW8csWmA==
X-Received: by 2002:a05:620a:22cc:: with SMTP id
 o12mr14870213qki.230.1593650179010; 
 Wed, 01 Jul 2020 17:36:19 -0700 (PDT)
Received: from LeoBras (200-236-245-17.dynamic.desktop.com.br.
 [200.236.245.17])
 by smtp.gmail.com with ESMTPSA id x13sm6545920qts.57.2020.07.01.17.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 17:36:18 -0700 (PDT)
Message-ID: <f1f0563dae4c81620b53bcc258f2960a7948a583.camel@gmail.com>
Subject: Re: [PATCH v2 1/6] powerpc/pseries/iommu: Create defines for
 operations in ibm,ddw-applicable
From: Leonardo Bras <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann
 <bauerman@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>
Date: Wed, 01 Jul 2020 21:36:12 -0300
In-Reply-To: <a884da45-7778-95cf-d65b-a6c82d2024a7@ozlabs.ru>
References: <20200624062411.367796-1-leobras.c@gmail.com>
 <20200624062411.367796-2-leobras.c@gmail.com>
 <b0caaaa0-14c9-51de-bb92-5be8ccaa418d@ozlabs.ru>
 <01443a2f1d58a595ddff03fd14fd56f4c26171bf.camel@gmail.com>
 <a884da45-7778-95cf-d65b-a6c82d2024a7@ozlabs.ru>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-07-02 at 10:21 +1000, Alexey Kardashevskiy wrote:
> > enum {
> >        DDW_QUERY_PE_DMA_WIN,
> >        DDW_CREATE_PE_DMA_WIN,
> >        DDW_REMOVE_PE_DMA_WIN,
> > 
> >        DDW_APPLICABLE_SIZE
> > }
> > IMO, it looks better than all the defines before.
> > 
> > What do you think?
> 
> No, not really, these come from a binary interface so the reader of this
> cares about absolute numbers and rather wants to see them explicitly.

Makes sense to me.
I am still getting experience on where to use enum vs define. Thanks
for the tip!

Using something like 
enum {
	DDW_QUERY_PE_DMA_WIN = 0,
	DDW_CREATE_PE_DMA_WIN = 1,
	DDW_REMOVE_PE_DMA_WIN = 2,

	DDW_APPLICABLE_SIZE
};

would be fine too?
Or should one stick to #define in this case?

Thank you,

