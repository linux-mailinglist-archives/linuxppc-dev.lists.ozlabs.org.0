Return-Path: <linuxppc-dev+bounces-109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D1C953D21
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2024 00:05:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQSIdf4S;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQSIdf4S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlK1K2srfz2xVq;
	Fri, 16 Aug 2024 08:05:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQSIdf4S;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQSIdf4S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rysulliv@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wl9564QFBz2ydG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 02:07:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723738068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTHy0VTZhp+zpCxqk4Vm43LA+qs7m6Yc40H41bHyaao=;
	b=dQSIdf4Sh9ZI/aHuq21+dFqKE0+YQiFZVj9Iyp+8e20f55uY3KDgTso/Q6wAbcJNJxd/By
	pSnUvak2vPH4RSdxz4584izpy36u56ThNtdq9p+3Pk7q7jC16mRBi2+yanPxKypJpIqmJb
	u9yTrZXFJyfWNqTl/uCr+Lac+vOBGYg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723738068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTHy0VTZhp+zpCxqk4Vm43LA+qs7m6Yc40H41bHyaao=;
	b=dQSIdf4Sh9ZI/aHuq21+dFqKE0+YQiFZVj9Iyp+8e20f55uY3KDgTso/Q6wAbcJNJxd/By
	pSnUvak2vPH4RSdxz4584izpy36u56ThNtdq9p+3Pk7q7jC16mRBi2+yanPxKypJpIqmJb
	u9yTrZXFJyfWNqTl/uCr+Lac+vOBGYg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-473-CJq-W_2tPkO0yu1adDEvNg-1; Thu,
 15 Aug 2024 12:07:44 -0400
X-MC-Unique: CJq-W_2tPkO0yu1adDEvNg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA2C71955D48;
	Thu, 15 Aug 2024 16:07:41 +0000 (UTC)
Received: from sullivan-work.redhat.com (unknown [10.22.32.144])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 360CE1955F66;
	Thu, 15 Aug 2024 16:07:38 +0000 (UTC)
From: Ryan Sullivan <rysulliv@redhat.com>
To: live-patching@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: rysulliv@redhat.com,
	joe.lawrence@redhat.com,
	pmladek@suse.com,
	mbenes@suse.cz,
	jikos@kernel.org,
	jpoimboe@kernel.org,
	naveen.n.rao@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	mpe@ellerman.id.au,
	npiggin@gmail.com
Subject: Re: [PATCH] powerpc/ftrace: restore r2 to caller's stack on livepatch sibling call
Date: Thu, 15 Aug 2024 12:07:07 -0400
Message-ID: <20240815160712.4689-1-rysulliv@redhat.com>
In-Reply-To: <87ed6q13xk.fsf@mail.lhotse>
References: <87ed6q13xk.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi Michael,

The r2 value is stored to the livepatch stack prior to entering into 
the livepatched code, so accessing it will gurantee the previous value
is restored.

Also, yes, this bug is caused by tooling that "scoops out" pre-compiled
code and places it into the livepatch handler (e.g. kpatch). However, 
since the large majority of customers interact with the livepatch 
subsystem through tooling, and this fix would not pose any serious risk
to either usability or security (other than those already present in 
livepatching), plus it would solve a large problem for these tools with
a simple fix, I feel as though this would be a useful update to 
livepatch.

Thanks,

Ryan


