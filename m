Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F938D681B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 19:21:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrVK30wfTz3fyy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 03:21:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.51; helo=mail-lf1-f51.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrVJd5VJMz3frv
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 03:21:04 +1000 (AEST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b8bb0c059so938852e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 10:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717176061; x=1717780861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UcZffNit3Q48QxaxBeTWm9BAi+VW/T91AWLE1RFtijg=;
        b=ZqpHJi9kEfPcdo2uTqWqkzVfzQxZj8uSMctosb5AcJUgmpC0ETWP63rzL94/EK9XCD
         muRoiNHQgaHX0K7hIQ5pbtazKjKzuqhy+10x37Yjj1FS+yVWxC90E/VGZQSb1aEtNasj
         On/BMK3o3V34n2VFr8IRCfm2aDEfnMM+jbKdNXdmFc4DfT9UAPoSabEGLO3hnWuKxDSC
         6PRAJnC7UrG1EXTLri+JdjHnJiDTo2fkMc121m5bjKv2ulNP2v2ni60WBUZJYwcSKc6u
         C9q8lWBwwE/CZ1VrLyiB4LXZR7x/Y0X+DZEsmAblHzuaUp6hswrr4WUD4fOnXc8FW/Cj
         KUAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvntuW8m7Q5nSMX5I0FK7myGFTXbFkmK1tcWZLsbQ+7BWOxFth+0DuHIHfhC4YdFHY0xKYhbc4GVhJjm0fN3ixfXMlmrybhJX1vIgUSw==
X-Gm-Message-State: AOJu0YwSbV3ic0qAK4fiK2fJgQkMtfa7Zjw2fLDNA1/UpmakbvewpO+9
	PXPrS5OU5mxuGlchYH5Pj4iAk/DbDfsreyLAiCx9hy80h09z7bBg
X-Google-Smtp-Source: AGHT+IG7Z5BYF385iHI0i33jHgHSCeGKSd6hDjXdu/WI/o3Y5RcAwwxAqoEMRU2Tq6s3pbIzs/V89A==
X-Received: by 2002:ac2:5b8c:0:b0:52b:3738:f56b with SMTP id 2adb3069b0e04-52b895970ecmr1918800e87.36.1717176060725;
        Fri, 31 May 2024 10:21:00 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-006.fbsv.net. [2a03:2880:30ff:6::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a31b990easm1201899a12.6.2024.05.31.10.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 10:21:00 -0700 (PDT)
Date: Fri, 31 May 2024 10:20:58 -0700
From: Breno Leitao <leitao@debian.org>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: Prevent Spectre v1 gadget construction in
 sys_rtas()
Message-ID: <ZloG+sK1aZ7mSnKj@gmail.com>
References: <20240530-sys_rtas-nargs-nret-v1-1-129acddd4d89@linux.ibm.com>
 <ZlnUaZiXM3Fuy+0g@gmail.com>
 <87le3q3p6r.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87le3q3p6r.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2024 at 11:45:48AM -0500, Nathan Lynch wrote:
> Breno Leitao <leitao@debian.org> writes:
> 
> > On Thu, May 30, 2024 at 07:44:12PM -0500, Nathan Lynch via B4 Relay wrote:
> >> From: Nathan Lynch <nathanl@linux.ibm.com>

> >> +	nargs = array_index_nospec(nargs, ARRAY_SIZE(args.args));
> >> +	nret = array_index_nospec(nret, ARRAY_SIZE(args.args) - nargs);
> >
> > On an unrelated note, can nargs and nret are integers and could be
> > eventually negative. Is this a valid use case?
> 
> No, it's not valid for a caller to provide negative nargs or nret. I
> convinced myself that this bounds check:
> 
> 	nargs = be32_to_cpu(args.nargs);
> 	nret  = be32_to_cpu(args.nret);
> 
> 	if (nargs >= ARRAY_SIZE(args.args)
> 	    || nret > ARRAY_SIZE(args.args)
> 	    || nargs + nret > ARRAY_SIZE(args.args))
> 		return -EINVAL;
> 
> rejects negative values of nargs or nret due to C's "usual arithmetic
> conversions", where nargs and nret are implicitly converted to size_t
> for the comparisons.
> 
> However I don't see any value in keeping them as signed int. I have some
> changes in progress in this area and I'll plan on making these unsigned.

yea, I think it will help to make this code easier to read/review.

Thanks again for fixing it.
