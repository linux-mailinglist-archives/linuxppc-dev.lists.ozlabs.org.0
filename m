Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BD0358D37
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 21:04:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGW0G4SXKz3bVF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 05:04:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.171;
 helo=mail-oi1-f171.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGVzx4LsFz30JW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 05:04:12 +1000 (AEST)
Received: by mail-oi1-f171.google.com with SMTP id 25so1797348oiy.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Apr 2021 12:04:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DUrGxOBRGKnSQEqHR05dYQldYxqAXJweo2+bFsG+WpA=;
 b=dfv3xI9QpoXvWiHxiYFA/Ycy/Jon3jNI6yufxe+dV7xyPpWFzvCSKRTay0IfqVTa/P
 /wonzAxnLA5hJxSpZpRRBFzS11duUTvGabv2BZ08oQc0FJx2JOOmksRV8inwyj3CcF1L
 /zVtWMqWL81XRF3oY0PJCz+SMlbjMrVdJ65ySQSeCKy+8PE3dFY0gFhrUvQdfV4YFZMD
 +qzzIvKRNeKsaZnrm/c3JA1tHle01pCm6ntVW8Brz8BnNzkaUwMywvyq3cei8PkZcrk0
 oG0I793nfNkA3I5bw1f85HSxcWUEL2y/NJiKFhZDXm4DbUWMm413+02cBENBE/23DFMq
 REpQ==
X-Gm-Message-State: AOAM530UUhAk/MPDWCdenL1OUAY8FQ6NOW7BZ7mS7JGD5nPqHfrh1FRo
 HEE7wgJYz6Yxpm7YMG1PAQ==
X-Google-Smtp-Source: ABdhPJzc/ezUgVYn/c2gVo9JEsyTGvBA4ZkkApktnBVPpB6CFT0oT9dS88OzEW8tCbInDt8Gjv+2IA==
X-Received: by 2002:a05:6808:138a:: with SMTP id
 c10mr7276133oiw.117.1617908650345; 
 Thu, 08 Apr 2021 12:04:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g9sm56746otk.6.2021.04.08.12.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 12:04:09 -0700 (PDT)
Received: (nullmailer pid 1795497 invoked by uid 1000);
 Thu, 08 Apr 2021 19:04:08 -0000
Date: Thu, 8 Apr 2021 14:04:08 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Walker <danielwa@cisco.com>
Subject: Re: [PATCH v4 19/20] mips: Convert to GENERIC_CMDLINE
Message-ID: <20210408190408.GA1724284@robh.at.kernel.org>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
 <a01b6cdbae01fff77e26f7a5c40ee5260e1952b5.1617375802.git.christophe.leroy@csgroup.eu>
 <20210406173836.GW2469518@zorba>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406173836.GW2469518@zorba>
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
Cc: linux-arch@vger.kernel.org, arnd@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, openrisc@lists.librecores.org,
 nios2 <ley.foon.tan@intel.com>, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, akpm@linux-foundation.org, will@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 06, 2021 at 10:38:36AM -0700, Daniel Walker wrote:
> On Fri, Apr 02, 2021 at 03:18:21PM +0000, Christophe Leroy wrote:
> > -config CMDLINE_BOOL
> > -	bool "Built-in kernel command line"
> > -	help
> > -	  For most systems, it is firmware or second stage bootloader that
> > -	  by default specifies the kernel command line options.  However,
> > -	  it might be necessary or advantageous to either override the
> > -	  default kernel command line or add a few extra options to it.
> > -	  For such cases, this option allows you to hardcode your own
> > -	  command line options directly into the kernel.  For that, you
> > -	  should choose 'Y' here, and fill in the extra boot arguments
> > -	  in CONFIG_CMDLINE.
> > -
> > -	  The built-in options will be concatenated to the default command
> > -	  line if CMDLINE_OVERRIDE is set to 'N'. Otherwise, the default
> > -	  command line will be ignored and replaced by the built-in string.
> > -
> > -	  Most MIPS systems will normally expect 'N' here and rely upon
> > -	  the command line from the firmware or the second-stage bootloader.
> > -
> 
> 
> See how you complained that I have CMDLINE_BOOL in my changed, and you think it
> shouldn't exist.
> 
> Yet here mips has it, and you just deleted it with no feature parity in your
> changes for this.

AFAICT, CMDLINE_BOOL equates to a non-empty or empty CONFIG_CMDLINE. You 
seem to need it just because you have CMDLINE_PREPEND and 
CMDLINE_APPEND. If that's not it, what feature is missing? CMDLINE_BOOL 
is not a feature, but an implementation detail.

Rob
