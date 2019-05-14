Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E8E1C081
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 04:08:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4531M63Td0zDqLT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 12:08:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=sergey.senozhatsky.work@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gDzV41z7"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4531Km1GtyzDqGL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 12:07:37 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id y3so7405577plp.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 19:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TUW58sFUl5sYOk3396X1MJdln3VeH0EXozxImmU59vw=;
 b=gDzV41z701QnCrQ26V0bq4z6xWTHENKXtePpErSx1cTFZAEnR170Cb3GIh6X6MaWvS
 P86mF/lBRPJUDD0wchUSehkIB5xvrpeuqlBa3x2Vho248Nn/RkVDrf1bXASF+h6UKMN4
 RJw+91n48gNTDuIgc4nbPEe+W1cxRXTb+DWKeIovw8s8/EnknXE17L/40Sd6A2Ubbr5c
 mWCcTIy0CdYWj6taw53+CmqUKawbwZcEhJArjMmEt6X9vDDg49TOvQtWuiBMVFdi+mON
 IPNk5ELNC1d9yajDGEoP1a7uD/eSigryhXScvyM69k3K7CMtduUWmvSmvMIQ6zmk60J0
 pPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TUW58sFUl5sYOk3396X1MJdln3VeH0EXozxImmU59vw=;
 b=Fheu7zeQaAA7YjA0GHunStcc/vqV+lBsKJs+GgpMUesDQ6lc+JSdL3lk2IvGBCbdhU
 QcU77DLVsupAnFv6d++B5YeW19ylDXj6dVveJqe0U/mMYCDuFxOkkd+jZWKprk4E8BK5
 9oLmKhVMYdzjFfJyu0a0RiL7kX0ElcdM7XwNhfEYSg05a15cA04EjT/UqG1JMpyh3IxU
 wt/2CHmpfHKNmcCM/EkxxJ5xY4mkPDoO3di/PMabivb9r+dGLNvoc357YvKfUIaHdL9w
 Ikvs2v3myZnykcAIicey1oU5BY+DlXsIifJai6uQLHipuU7D8NzXaOsYNH2poJUlWWAg
 Qg4Q==
X-Gm-Message-State: APjAAAW3jMQs8Pz9y0cw3kjPVtSOOLgCTS+YDhl7U1lfV1XWRqzNkrfh
 lK7v+Vghq7/i5oGt11aE3R0=
X-Google-Smtp-Source: APXvYqyCY0Kzi1kXb0vmv87aGVQQILnCJJ8qRJqL49F8s8Dds7JPB7O9ESBZIffOVdyOAeqexsF5/w==
X-Received: by 2002:a17:902:108a:: with SMTP id
 c10mr35439629pla.48.1557799654316; 
 Mon, 13 May 2019 19:07:34 -0700 (PDT)
Received: from localhost ([39.7.55.172])
 by smtp.gmail.com with ESMTPSA id v64sm19993908pfv.106.2019.05.13.19.07.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 19:07:33 -0700 (PDT)
Date: Tue, 14 May 2019 11:07:30 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
Message-ID: <20190514020730.GA651@jagdpanzerIV>
References: <20190510081635.GA4533@jagdpanzerIV>
 <20190510084213.22149-1-pmladek@suse.com>
 <20190510122401.21a598f6@gandalf.local.home>
 <daf4dfd1-7f4f-8b92-6866-437c3a2be28b@c-s.fr>
 <096d6c9c17b3484484d9d9d3f3aa3a7c@AcuMS.aculab.com>
 <20190513091320.GK9224@smile.fi.intel.com>
 <20190513124220.wty2qbnz4wo52h3x@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190513124220.wty2qbnz4wo52h3x@pathway.suse.cz>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@aculab.com>, Stephen Rothwell <sfr@ozlabs.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (05/13/19 14:42), Petr Mladek wrote:
> > The "(null)" is good enough by itself and already an established
> > practice..
> 
> (efault) made more sense with the probe_kernel_read() that
> checked wide range of addresses. Well, I still think that
> it makes sense to distinguish a pure NULL. And it still
> used also for IS_ERR_VALUE().

Wouldn't anything within first PAGE_SIZE bytes be reported as
a NULL deref?

       char *p = (char *)(PAGE_SIZE - 2);
       *p = 'a';

gives

 kernel: BUG: kernel NULL pointer dereference, address = 0000000000000ffe
 kernel: #PF: supervisor-privileged write access from kernel code
 kernel: #PF: error_code(0x0002) - not-present page


And I like Steven's "(fault)" idea.
How about this:

	if ptr < PAGE_SIZE		-> "(null)"
	if IS_ERR_VALUE(ptr)		-> "(fault)"

	-ss
