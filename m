Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D06B595B10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 14:01:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6V996bt8z3c4Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 22:01:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i92FOHFV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NbJAAGXa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i92FOHFV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NbJAAGXa;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6V8T4ydTz3bZY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 22:00:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660651218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pwz8sbWeHrkfuw7TlrsGXqGQd9GZSL1nvueVrYuNuZ0=;
	b=i92FOHFVbf9bU9evkFdsmwSNSBf6HWh9IEQMDNtx7Cy2RwialXFTcaak8fl8Zi6oQfZphC
	Gs9HEVI36fq29EFPDuIqQL70q09fn9vJC/O+B3Qs7UkKjT177RljsHzkfa+nVsgKwcy9dO
	vWH5/qAfO8RvmxEMcjhgKEx3tq0Z/Zo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660651219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pwz8sbWeHrkfuw7TlrsGXqGQd9GZSL1nvueVrYuNuZ0=;
	b=NbJAAGXaDePzXDLNZgOvKqwsf6Rui8Qm0mgh69MGXNlX5r39Y7XWmlQsC8l/EdntJQYYDm
	zL9i6uKuydP+SQVdMorsZQ2UV3gCh8YZy6j1GV0FY4i4FlgPiGzlwiMqvkaGW4kXgFAZpT
	R2aHa9JUCbJLX9WwuBEig2b/QESkTHw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-p1T1oVFYO5e8oBTmWaZ5mQ-1; Tue, 16 Aug 2022 08:00:17 -0400
X-MC-Unique: p1T1oVFYO5e8oBTmWaZ5mQ-1
Received: by mail-wm1-f72.google.com with SMTP id 203-20020a1c02d4000000b003a5f5bce876so1561027wmc.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 05:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Pwz8sbWeHrkfuw7TlrsGXqGQd9GZSL1nvueVrYuNuZ0=;
        b=QAjjj3TEiRjHOci93k6LAOmhy1Y2gtNKNyYAJja+kPsP6PJrwML1qgsQUlDLFnkGsF
         /1xzJB4e73MwAXFRhuiu/Uv/VYguu5tRQT1WEd34SnRPWxsS4GlJCLorRehZ8Mygtt5k
         kgr6EIrGdygmxXd3VE49FLl2Ql2odJWPw9nAAG/nmyTyl2/Bfc4pbROFaZItu5B+WQwv
         Ae2RjAkS4CW6gBr+tSpgqcJIcpBjpGBY3xi/LKht2Qq26z8XjDMRznlwLGLgHxvH7b/n
         cL3uJnY7pLPBHk/4nvWyu32zjmyhFkR6QCqROFes1Cqv7XG1z22bdE72cAqSjQu6RbaO
         TCwQ==
X-Gm-Message-State: ACgBeo08tXD8kpQZX9AicqIg/3ntZE9zx+gnQnhngjow9cgVS6rXQ7R8
	I4MV2rQ/Q+1Uqj+WT4t8o7XIHi4sX1MsrgWuGq1yRPT4IBtIxP+rCv2ZavjSEpnF/FTSqkpU+oD
	XClKD8IAzoAeT0EJ9OVNTJjoLog==
X-Received: by 2002:a05:6000:2a8:b0:220:6893:4ff6 with SMTP id l8-20020a05600002a800b0022068934ff6mr11805880wry.170.1660651216642;
        Tue, 16 Aug 2022 05:00:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5+lxy72X0p8q1N/VA1caBeK9MeCyZ3upRXQRZYRJDWig+QRJxJ+nox5XWYdcFyrgUtFuIZyQ==
X-Received: by 2002:a05:6000:2a8:b0:220:6893:4ff6 with SMTP id l8-20020a05600002a800b0022068934ff6mr11805859wry.170.1660651216420;
        Tue, 16 Aug 2022 05:00:16 -0700 (PDT)
Received: from redhat.com ([2.55.4.37])
        by smtp.gmail.com with ESMTPSA id cl5-20020a5d5f05000000b00224f7c1328dsm8312482wrb.67.2022.08.16.05.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 05:00:15 -0700 (PDT)
Date: Tue, 16 Aug 2022 08:00:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 1/4] Make place for common balloon code
Message-ID: <20220816075953-mutt-send-email-mst@kernel.org>
References: <20220816094117.3144881-1-alexander.atanasov@virtuozzo.com>
 <20220816094117.3144881-2-alexander.atanasov@virtuozzo.com>
 <YvtoDxvefWUJBfAS@kroah.com>
 <f88fe469-d4a4-3240-b325-a745255bf01c@virtuozzo.com>
 <YvuF8CsP0M1TAK1a@kroah.com>
MIME-Version: 1.0
In-Reply-To: <YvuF8CsP0M1TAK1a@kroah.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>, VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Jason Wang <jasowang@redhat.com>, Alexander Atanasov <alexander.atanasov@virtuozzo.com>, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, Nicholas Piggin <npiggin@gmail.com>, kernel@openvz.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 16, 2022 at 01:56:32PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Aug 16, 2022 at 02:47:22PM +0300, Alexander Atanasov wrote:
> > Hello,
> > 
> > On 16.08.22 12:49, Greg Kroah-Hartman wrote:
> > > On Tue, Aug 16, 2022 at 12:41:14PM +0300, Alexander Atanasov wrote:
> > 
> > > >   rename include/linux/{balloon_compaction.h => balloon_common.h} (99%)
> > > 
> > > Why rename the .h file?  It still handles the "balloon compaction"
> > > logic.
> > 
> > File contains code that is common to balloon drivers,
> > compaction is only part of it. Series add more code to it.
> > Since it was suggested to use it for such common code.
> > I find that common becomes a better name for it so the rename.
> > I can drop the rename easy on next iteration if you suggest to.
> 
> "balloon_common.h" is very vague, you should only need one balloon.h
> file in the include/linux/ directory, right, so of course it is "common"
> :)
> 
> thanks,
> 
> greg "naming is hard" k-h

Yea, just call it balloon.h and balloon.c then.

-- 
MST

