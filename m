Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 237826BBA28
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 17:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcGZL0Q9yz3cjR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 03:49:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FQSiS9fd;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FQSiS9fd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FQSiS9fd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FQSiS9fd;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcGYL5Wk2z3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 03:48:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678898898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nm5gfruTLsdagm9njmR29/Ig/a6aY+NuRLyWyFUeNqo=;
	b=FQSiS9fdfUyaG1punQWH9LZA1+RfMd2cNJ5xsSQWz4yr1SqzdJzwjeJk3CzHqpGOPcdHcb
	wXMlog5vwafcEpMz7RW41+nwhiKjjVKfatODIxalzyuwzenfWPnBDqwTPfDFx3fjJRGH08
	CqeYrwW6HcbE4mC3s9oQHaZZUtH5X3E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678898898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nm5gfruTLsdagm9njmR29/Ig/a6aY+NuRLyWyFUeNqo=;
	b=FQSiS9fdfUyaG1punQWH9LZA1+RfMd2cNJ5xsSQWz4yr1SqzdJzwjeJk3CzHqpGOPcdHcb
	wXMlog5vwafcEpMz7RW41+nwhiKjjVKfatODIxalzyuwzenfWPnBDqwTPfDFx3fjJRGH08
	CqeYrwW6HcbE4mC3s9oQHaZZUtH5X3E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-X0SlLsC7Ol-gYa53rlmS7g-1; Wed, 15 Mar 2023 12:48:16 -0400
X-MC-Unique: X0SlLsC7Ol-gYa53rlmS7g-1
Received: by mail-wm1-f71.google.com with SMTP id bd26-20020a05600c1f1a00b003ed23f09060so979337wmb.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 09:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678898896;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nm5gfruTLsdagm9njmR29/Ig/a6aY+NuRLyWyFUeNqo=;
        b=QEmv+rhGW8BXN3EX4taqt57lYFzetrXbgzp4sam/nJ4KHMz70fPS7qFqjoV0pkVpXQ
         3GvmRzZtA6MQKO6B3HTQbzvZGvCOE67XKGH/oWGo5+eQG1fbrOPupamfcw3OH92lte04
         uPDD2YCVCZJDKhQk8SclopYYASGa3fXZwyLW/gZ2B0KBGgJUHCPmbZwcP2ydvM8K6rP2
         O8TytvWTNi7rAdYq19TE3RiB7k8PqD2F4S0IItQnInRxwrv+s20plC3R5/+ruYL9qBou
         gRDTx9VOLw/OMuQ4JZowTiKeJBEKsSjDqeDTNnwy93z7ll84aqPcwYGYqOegRgz1ci/m
         kGSg==
X-Gm-Message-State: AO0yUKVW7iI74JFCwZT03VG3m7JTBojcLIU3GxAcSU7YX/gB9rdMOAUf
	90YBMi4MbnUZiPvls029PLApp/Cfc0xiz+3oizUyZelYPdLXoOLKVdqumeWFOESNecQGkIkErJH
	5XaaY+QzF0lwbYgdwDQ1tKbeH8w==
X-Received: by 2002:adf:f209:0:b0:2d0:27dd:9c40 with SMTP id p9-20020adff209000000b002d027dd9c40mr2037105wro.26.1678898895903;
        Wed, 15 Mar 2023 09:48:15 -0700 (PDT)
X-Google-Smtp-Source: AK7set9jfn/9WqJrQVlsKAuBzHsI/W7q2SC2Q1SzV+VIJZiJybGCBhMLfTelmL18XXOCJLm0rYHCmQ==
X-Received: by 2002:adf:f209:0:b0:2d0:27dd:9c40 with SMTP id p9-20020adff209000000b002d027dd9c40mr2037086wro.26.1678898895600;
        Wed, 15 Mar 2023 09:48:15 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id h13-20020a056000000d00b002cfec8b7f89sm4560610wrx.77.2023.03.15.09.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:48:15 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Yury Norov <yury.norov@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched/topology: introduce node_has_cpus() macro
In-Reply-To: <20230222025029.453834-1-yury.norov@gmail.com>
References: <20230222025029.453834-1-yury.norov@gmail.com>
Date: Wed, 15 Mar 2023 16:48:12 +0000
Message-ID: <xhsmhbkkum04z.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: Barry Song <baohua@kernel.org>, Yury Norov <yury.norov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21/02/23 18:50, Yury Norov wrote:
> Currently, to check if NUMA node has CPUs, one has to use the
> nr_cpus_node() macro, which ends up with cpumask_weight. We can do it
> better with cpumask_empty(), because the latter can potentially return
> earlier - as soon as 1st set bit found.
>
> This patch adds a node_has_cpus() macro to implement that.
>
> Signed-off-by: Yury Norov <yury.norov@gmail.com>

Reviewed-by: Valentin Schneider <vschneid@redhat.com>

