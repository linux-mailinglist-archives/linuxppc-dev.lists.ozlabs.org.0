Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1770A8A8610
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 16:37:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G+k3hiUJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SERyfo09;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKNm05wTFz3cHf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 00:37:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G+k3hiUJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SERyfo09;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jsavitz@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKNlJ43ybz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 00:36:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713364598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mWeLJaiXyoba5pQvg6N4T8tnTXbzZoy7aDMWdTcbtIM=;
	b=G+k3hiUJ5Jp01y8Nc0b0aQ437GTeCmowcUc18LgQk+wQLE580t71gpnFJCwut5w8o0FNnM
	rT1l+DCqOZIi82RsqdcnK3cHyjW/ozi36W4rLrysa0D8xyxZn3I9G0m8wH1d3igxeB18xk
	j8lcTKFoy9OtT5mF/abP2K3XBqOa7tE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713364599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mWeLJaiXyoba5pQvg6N4T8tnTXbzZoy7aDMWdTcbtIM=;
	b=SERyfo09WADXpWDz8t8ddDkH59oqYl6tV9l7BJaveTJO0pznlA1nFUzUNpQVNdtF650lu4
	fIXWkBbEuzDAwUC6uP6PriooGxsixIDXK+E9CLP++OqB/OWmwXzeYxaFpcu3i+DJ+CmAHO
	GqefVqMeGnkgoe6SVBFXG4D1LDuAZYM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-g3eGVdO5PhyKEnaRmfYkkg-1; Wed, 17 Apr 2024 10:36:35 -0400
X-MC-Unique: g3eGVdO5PhyKEnaRmfYkkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A64AC80C170;
	Wed, 17 Apr 2024 14:36:33 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.34.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD4E62166B31;
	Wed, 17 Apr 2024 14:36:32 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: aneesh.kumar@kernel.org
Subject: Re: [PATCH 1/3] powerpc/mm: Align memory_limit value specified using mem= kernel parameter
Date: Wed, 17 Apr 2024 10:36:31 -0400
Message-ID: <20240417143631.253489-1-jsavitz@redhat.com>
In-Reply-To: <20240403083611.172833-1-aneesh.kumar@kernel.org>
References: <20240403083611.172833-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: naveen@kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, Joel Savitz <jsavitz@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Acked-by: Joel Savitz <jsavitz@redhat.com>

