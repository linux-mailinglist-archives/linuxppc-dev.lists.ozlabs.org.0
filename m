Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A9228FEAE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 08:58:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCH6H2Hy6zDqW9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 17:57:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+3f298eef0c732a4c5343+6263+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=cdWToJTe; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCH4N05LQzDqVF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 17:56:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MYM5G+dttTgthRfiyRZGB6ieggpXe3r70jfnD17DcHA=; b=cdWToJTeEIuE6QqdvcKPWex0o3
 QOahBMYsFdJoT/fb5G5xvV1bSsYWWsEJIlY7cVoVbnL/qIye7jO+PErDlfU5fIjocg+iYPqolY3UO
 wrI+uvTBxZ/2aIADqVwwQt+FiH2cQr8bEqycZwhEo7TjDjIR1NEa/Q0gjD5JW866eVnTUb7McVGpN
 354AfcQIz1KciaQhSmMUqxLN4lUE8Tq/aUd3oJM+mjZokBTSWLixN8CjPk1adTEzp0sA4vSqqXlk8
 O+FuX2NN9vhBpTf+6v8krO1CpuDtlwC41+gWxWk/vwpEyPDbpYrFZi54Od5ymA3gEOVTRalPN7vgq
 aFFk0Svg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kTJey-0002h5-4I; Fri, 16 Oct 2020 06:56:16 +0000
Date: Fri, 16 Oct 2020 07:56:16 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Christopher M. Riedl" <cmr@codefail.de>
Subject: Re: [PATCH 3/8] powerpc: Mark functions called inside uaccess blocks
 w/ 'notrace'
Message-ID: <20201016065616.GB9343@infradead.org>
References: <20201015150159.28933-1-cmr@codefail.de>
 <20201015150159.28933-4-cmr@codefail.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015150159.28933-4-cmr@codefail.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: peterz@infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 15, 2020 at 10:01:54AM -0500, Christopher M. Riedl wrote:
> Functions called between user_*_access_begin() and user_*_access_end()
> should be either inlined or marked 'notrace' to prevent leaving
> userspace access exposed. Mark any such functions relevant to signal
> handling so that subsequent patches can call them inside uaccess blocks.

I don't think running this much code with uaccess enabled is a good
idea.  Please refactor the code to reduce the criticial sections with
uaccess enabled.

Btw, does powerpc already have the objtool validation that we don't
accidentally jump out of unsafe uaccess critical sections?
