Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2900D25D110
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 08:02:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjRsK0NK2zDr4F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 16:02:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::643;
 helo=mail-ej1-x643.google.com; envelope-from=mingo.kernel.org@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BUUjH649; dkim-atps=neutral
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjRqQ0Kj2zDrF4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 16:00:29 +1000 (AEST)
Received: by mail-ej1-x643.google.com with SMTP id a26so7057501ejc.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Sep 2020 23:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/RbKFcDe/9p0eCn6PVwL3hGGJ9h1UwG7+EMiD7IMIjA=;
 b=BUUjH6498pxgKlkI7TBQkAxL4YAOzv1LuihEIjbUhMlESZB9pcmBNlol1CXWwjT3QA
 GLzgR1b5EhnjoX1bPYt3Hi+Ahrt4TJ6gkdCjW6PB4FmtMV4zqNCGt9xlA+64OUjDtdeA
 NrrDxCFEgrxrN8exnV279/ZKGMyixFaXASn2kADFjY4/3WaHmmuCEQmWp3MDs66/miJa
 ksLSa3zmEexrNsV7V+5t1v6NG/6WmSqUBJCREH+GegDbN0ai4pgrWp5wyoeIwAAIN5yv
 83ERivChI0D+Ky59cSCS2nhTILw7TgtSN99hoNpdlqipXI1DUcgXY1dIukd08J8Jc2wL
 oG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=/RbKFcDe/9p0eCn6PVwL3hGGJ9h1UwG7+EMiD7IMIjA=;
 b=gF20k76ZER3SybIH0lGCXl8vB/sSCFFaIdwebs8Cxe3lGM9B/PnxUiWF16ECEUuYsW
 YhsIo43Trj8RYyRT3b+A4a8ESEZztadhlmg2/X+ZZB2jFYumjGSvIjPk9ZZqInFytDml
 BuYzsIfIFNGwCPQ++rviI8XQWHE2TOcUFOEiEFNzcZnkFYo1hzV8XVBLeeHfEClSaT6F
 M7BIzKhDzvhyc8bkW5P3ukN5YHFVP5oCRhPRWvQunHhmUXo6dostAng1/N1whEvHsAiO
 4lOdp5qWU7FQYNknL/vVWP/Q9dbF0A3SuDNMlhQminzvgG2SncSuriFgjSs4xih4mxoa
 5ZGw==
X-Gm-Message-State: AOAM5300U0fs9udMOO0LwBCketrlOPHg0k2+5oiKTJF7BTZf4z4oNNYu
 KuplLkcFZtO3rHREoKbiuBM=
X-Google-Smtp-Source: ABdhPJw7qUGl/jQF6c84gFZcHhRqBS1gA5FSgsoreOSwdAggSpDPGO0dfyGq/1ecMqRsqPeYMPizIw==
X-Received: by 2002:a17:906:a1d7:: with SMTP id
 bx23mr5864845ejb.273.1599199226711; 
 Thu, 03 Sep 2020 23:00:26 -0700 (PDT)
Received: from gmail.com (563BA415.dsl.pool.telekom.hu. [86.59.164.21])
 by smtp.gmail.com with ESMTPSA id r26sm5332257ejb.102.2020.09.03.23.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 23:00:26 -0700 (PDT)
Date: Fri, 4 Sep 2020 08:00:24 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: remove the last set_fs() in common code, and remove it for x86
 and powerpc v3
Message-ID: <20200904060024.GA2779810@gmail.com>
References: <20200903142242.925828-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903142242.925828-1-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Alexey Dobriyan <adobriyan@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Christoph Hellwig <hch@lst.de> wrote:

> Hi all,
> 
> this series removes the last set_fs() used to force a kernel address
> space for the uaccess code in the kernel read/write/splice code, and then
> stops implementing the address space overrides entirely for x86 and
> powerpc.

Cool! For the x86 bits:

  Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
