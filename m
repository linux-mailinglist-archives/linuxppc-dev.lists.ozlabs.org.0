Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEDE1D5A5E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 21:50:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NzXb22VgzDr7j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 05:50:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=forty7Li; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NzVh1w7lzDr1Q
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 05:48:42 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id b8so1319702plm.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 12:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WC37HJp5SKUKE1fd2XCJ1OzGQx44RrsCosnhUT+bw24=;
 b=forty7LiZ/iuk6SLOTVtqdV3e1Dkwj4LmlQwa/W2IUKQS7OAVsqEaMc14nCdJxqhn2
 BRcSTXihVPu98Jc8ZpogMyqu+lml0krFOcd7hnpsHQJDbsHp31uLOk9UyVuXSY550Etv
 /ybqYX8gctpAEa7DYWQuEbPBMOuKsDgbn/5f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WC37HJp5SKUKE1fd2XCJ1OzGQx44RrsCosnhUT+bw24=;
 b=TNYee99fBv5GKF/dxHcLXIskETzTKn5Tf1nTPpwknUX1KqB+xg89+YDZ4qqUZFjA68
 5r1TawXLznXM+YFr2AI6jZ2GvTWsjalxjA40f87FWoNDKaLtHg+bUW4KOnbtGL1wCiqk
 d9OQLvA15aPGnJBv7VmUIP2IrwYYSsnju633TsEzhm5FEuo0dsNs5Eb2rQcsXGi3zDGJ
 6MDxsMfVet7rkXUogNdatuuYopfOWfxQADQ6v1HLET8ehkH+a9KM3f52NcsMQdrjqCwc
 LVX1kMd86pCLOT1ZifqqqJd0ftrvg95FQ7OBK2bE2ruOAWoAO1/UoNEKdPCZQo3Vc6aJ
 WYKA==
X-Gm-Message-State: AOAM533lxt5toQ+4ctSQyh6detOpIPxTkEN1mEaDcYvNUtUK6iOM3PK7
 J17HgnNii4dXFNIjZgKXoL/3aA==
X-Google-Smtp-Source: ABdhPJyqeZfGlv2x9taPmcDJmvn+guwa5XPJm8zIoyr0Laky0NrXpoQAMT9zTkN2ddJABAL26BHU/g==
X-Received: by 2002:a17:90a:e016:: with SMTP id
 u22mr2811624pjy.28.1589572120319; 
 Fri, 15 May 2020 12:48:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w73sm2646498pfd.113.2020.05.15.12.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 12:48:39 -0700 (PDT)
Date: Fri, 15 May 2020 12:48:38 -0700
From: Kees Cook <keescook@chromium.org>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Subject: Re: [PATCH v4 5/6] pstore/ram: Introduce max_reason and convert
 dump_oops
Message-ID: <202005151248.1A3E0EA8@keescook>
References: <20200515184434.8470-1-keescook@chromium.org>
 <20200515184434.8470-6-keescook@chromium.org>
 <CA+CK2bAvTo1=oLH32-Wdz07F3OP=T+gA6GgzkBH1Q9W8upHkNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bAvTo1=oLH32-Wdz07F3OP=T+gA6GgzkBH1Q9W8upHkNg@mail.gmail.com>
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Anton Vorontsov <anton@enomsg.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 15, 2020 at 03:30:27PM -0400, Pavel Tatashin wrote:
> >  #define parse_u32(name, field, default_value) {                                \
> >                 ret = ramoops_parse_dt_u32(pdev, name, default_value,   \
> 
> The series seems to be missing the patch where ramoops_parse_dt_size
> -> ramoops_parse_dt_u32 get renamed, and updated to handle default
> value.

Oops! Sorry, I cut the line in the wrong place for sending out the delta
on top of the pstore tree. :)

It's unchanged from:
https://lore.kernel.org/lkml/20200506211523.15077-4-keescook@chromium.org/

-- 
Kees Cook
