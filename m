Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE84DA511
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 23:11:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJ70m5m7hz3bZn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 09:11:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q678Y8av;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q678Y8av;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jpoimboe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Q678Y8av; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q678Y8av; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJ6zc6gFZz30J7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 09:10:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647382234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sQtSBHNQH4OCn0hjFNRX0y7NCWzjkpGXawmrdrNsMPU=;
 b=Q678Y8avw30TUZxUrgvKiqRyOZByAS8j/bh8bCaGdqWJ85t4rLyVoFPRpuIyJvEufyiNPe
 3B/n57toJeqWuUziLHcMx3nQ94ET42BdO8DO8ywl8KwAB61UpptZUwGZHt1GdS7pO44bI+
 biKtLIhEO17qafJU5Js/DdyKzbkP6RA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647382234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sQtSBHNQH4OCn0hjFNRX0y7NCWzjkpGXawmrdrNsMPU=;
 b=Q678Y8avw30TUZxUrgvKiqRyOZByAS8j/bh8bCaGdqWJ85t4rLyVoFPRpuIyJvEufyiNPe
 3B/n57toJeqWuUziLHcMx3nQ94ET42BdO8DO8ywl8KwAB61UpptZUwGZHt1GdS7pO44bI+
 biKtLIhEO17qafJU5Js/DdyKzbkP6RA=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-1snqSJEPNtCL4Myw8Q8zBw-1; Tue, 15 Mar 2022 18:10:32 -0400
X-MC-Unique: 1snqSJEPNtCL4Myw8Q8zBw-1
Received: by mail-ot1-f71.google.com with SMTP id
 q18-20020a05683022d200b005b23730dc8eso183439otc.19
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 15:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sQtSBHNQH4OCn0hjFNRX0y7NCWzjkpGXawmrdrNsMPU=;
 b=1wDrlHf6y7qAUvJFA0wICjjPeEIaFQSmp1Xos9dwOZsObk96ZnO8pDBjoH2aodl14C
 hvbKBVYbOJFztj5vlrsOZ/5+mmm7mnZOBix6MT97JPZUU7bwQaim+c3y4qqEFF+piInm
 ++nmnuuIieV7OKn97CV4tc8h/9+TnRZB7jbx+1y5+vQQLsxZEsCyvKYkwR500GLGZk80
 7qDtn3DIVt+pfJXpYCXPOlyCjcPNgeAzIn+sRdNhIHRl1CLBsbCBT9CHbIb/1D0z409v
 kyQx0mQwzlQDkcc34HeDdjnqZdyi7+IpR/QJfcL+tOIPTkj5fobFXShUxZ3x5qWinGeb
 MxTg==
X-Gm-Message-State: AOAM532JWiKdz8UCGXty5V2hOqVIihMuIDk0t1DaK/47SfggKWvzdDmV
 qgIsHjccTKNuxbFYfQcYH4XIMPIsH5Qz8GT/E077pfncJOv2VGnDKj2vkEp1V8VCUDi3yTOdet/
 YM7m1LdQG/xH3nuGswxihjMwX0g==
X-Received: by 2002:a05:6808:28f:b0:2ec:c78d:cc7d with SMTP id
 z15-20020a056808028f00b002ecc78dcc7dmr2610636oic.208.1647382232246; 
 Tue, 15 Mar 2022 15:10:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPTq+4slSzvGFi+Pc0Q+T45lfMAx1zAPc2CPr2l3CS2WVg98Wkf4Z/j/hCEL4qs/m9QAQ5Lg==
X-Received: by 2002:a05:6808:28f:b0:2ec:c78d:cc7d with SMTP id
 z15-20020a056808028f00b002ecc78dcc7dmr2610618oic.208.1647382232020; 
 Tue, 15 Mar 2022 15:10:32 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::48])
 by smtp.gmail.com with ESMTPSA id
 e5-20020acab505000000b002ecfd33334bsm181844oif.53.2022.03.15.15.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 15:10:31 -0700 (PDT)
Date: Tue, 15 Mar 2022 15:10:27 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 2/2] static_call: Remove __DEFINE_STATIC_CALL macro
Message-ID: <20220315221027.adisw5th4t6aibrb@treble>
References: <1e0a61a88f52a460f62a58ffc2a5f847d1f7d9d8.1647253456.git.christophe.leroy@csgroup.eu>
 <329074f92d96e3220ebe15da7bbe2779beee31eb.1647253456.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <329074f92d96e3220ebe15da7bbe2779beee31eb.1647253456.git.christophe.leroy@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
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
Cc: x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Jason Baron <jbaron@akamai.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 14, 2022 at 11:27:36AM +0100, Christophe Leroy wrote:
> Only DEFINE_STATIC_CALL use __DEFINE_STATIC_CALL macro now when
> CONFIG_HAVE_STATIC_CALL is selected.
> 
> Only keep __DEFINE_STATIC_CALL() for the generic fallback, and
> also use it to implement DEFINE_STATIC_CALL_NULL() in that case.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

