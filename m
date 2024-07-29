Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 840B7940158
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:48:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FW+CrjMb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FW+CrjMb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXtn13DNqz3cYq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 08:48:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FW+CrjMb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FW+CrjMb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=rysulliv@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXhSV5cj9z3cXN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 01:03:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722265395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oc+mhczrJ1nkvAWktInjEDKrDKX570Q/kD7809NJ9Ro=;
	b=FW+CrjMbv9bGUtr4+J4bBuSta4pziDVLWvDNtAtK0sjfsjaIZQ3dCT/vypT+bB82qAXSNa
	PWKJP+CYZ9X5dDWXOfN8OznaFwWcBIOCqz2H4/DCz1HtVFIYXcEuVWPTaEyNR6tYXaEqU1
	gAJKPXWQuMVN79Rd/qggDLTPucwZcLQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722265395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oc+mhczrJ1nkvAWktInjEDKrDKX570Q/kD7809NJ9Ro=;
	b=FW+CrjMbv9bGUtr4+J4bBuSta4pziDVLWvDNtAtK0sjfsjaIZQ3dCT/vypT+bB82qAXSNa
	PWKJP+CYZ9X5dDWXOfN8OznaFwWcBIOCqz2H4/DCz1HtVFIYXcEuVWPTaEyNR6tYXaEqU1
	gAJKPXWQuMVN79Rd/qggDLTPucwZcLQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-70-wr2rRBWJNkK-it_mCdlYxQ-1; Mon,
 29 Jul 2024 11:03:08 -0400
X-MC-Unique: wr2rRBWJNkK-it_mCdlYxQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B86B91944D30;
	Mon, 29 Jul 2024 15:03:04 +0000 (UTC)
Received: from sullivan-work.redhat.com (unknown [10.22.9.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 93C0F300019D;
	Mon, 29 Jul 2024 15:02:50 +0000 (UTC)
From: Ryan Sullivan <rysulliv@redhat.com>
To: live-patching@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/ftrace: restore r2 to caller's stack on livepatch sibling call
Date: Mon, 29 Jul 2024 11:02:36 -0400
Message-ID: <20240729150246.8939-1-rysulliv@redhat.com>
In-Reply-To: <878qxkp9jl.fsf@mail.lhotse>
References: <878qxkp9jl.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mailman-Approved-At: Tue, 30 Jul 2024 08:47:06 +1000
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
Cc: pmladek@suse.com, joe.lawrence@redhat.com, jikos@kernel.org, christophe.leroy@csgroup.eu, rysulliv@redhat.com, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, mbenes@suse.cz, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,

In the case of no sibling call within the livepatch then the store is  
only "restoring" the r2 value that was already there as it is stored  
and retrieved from the livepatch stack. The only time that the r2 value  
is corrupted is in the case of a sibling call and thus this additional  
store is just restoring the caller's context as a safety precaution.  
Also should this explanation be put into the patch itself or will these  
messages suffice as a reference?

Cheers,

Ryan

