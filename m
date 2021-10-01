Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 922A741E768
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 08:11:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLKVk3K0gz3c6J
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 16:11:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Ujm9lvTp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Ujm9lvTp; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLKV23m7yz2yg8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 16:10:32 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id s16so7055559pfk.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 23:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=SVNCJg162wQKH+vF4mW53F3Olu9DZXl5878e7QvoVgw=;
 b=Ujm9lvTpV7bv9t19flD4jEftKAKf9swtmI3NwtF8LaFFn36z1SIG51PhPIMY4nPZSa
 S98xDbo0sP8MMTM6l6KFuXtpan6j+LjynwslmGTrRX/08MhOa/x46h0kf/hKvMddNYfs
 AaYs4u/kOrKQRL1oIfs0pVkXMpjMhkB/Qg4Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=SVNCJg162wQKH+vF4mW53F3Olu9DZXl5878e7QvoVgw=;
 b=QiAEaoN9UgjcYOnCcO3npITPkVwqcBAbfJzM/O6/kWQZtdLdQ7ncD7V6VJIFbq69Vr
 inSGLpEu1DrNiT4KYXKGDDsbXQxzT4JVi2FFxSksQ0ZAKH7OYGCtHssYXkrI2SlApZOn
 71WCVR/YEQP0xFl57H/RGqNQ41AmKun4zXYgHJaOk3Wb1M4lbDyyeR2smL3Nt/b0o1Hw
 JrMZXhNKfPLnqay7kcwIOZRB0CsPN1QxDmYNdO8qAT5XnreenYkl9m/XW4DdiXVSpdsW
 +rdVWisODJSPSzlzjSe/5O4pWjajlkCCuxexLsSk477QaQdP7Gz5YwQkSQuUcgPkgojJ
 fKoQ==
X-Gm-Message-State: AOAM532hS/CCC7p5XNKoTxLi+dAw4zXhhsFb0d6KF4/VmwGGytD5DjOd
 T0Goc8XsahfMkxcODYpHAKCCKLt2ry26Gw==
X-Google-Smtp-Source: ABdhPJywh2DxVOTOoNpr3GzjQgNA3w+y+gLBSQpYGtNtkGeLCjITLjfpu02d9LQ22gaqyidTp3xeuw==
X-Received: by 2002:aa7:9e0a:0:b0:447:a7f7:40e with SMTP id
 y10-20020aa79e0a000000b00447a7f7040emr8394328pfq.37.1633068628939; 
 Thu, 30 Sep 2021 23:10:28 -0700 (PDT)
Received: from localhost ([2001:4479:e200:df00:c98c:9868:6328:c144])
 by smtp.gmail.com with ESMTPSA id s22sm4855809pfe.76.2021.09.30.23.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 23:10:28 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/powernv/prd: Unregister OPAL_MSG_PRD2 notifier
 during module unload
In-Reply-To: <20210928120933.196571-1-hegdevasant@linux.vnet.ibm.com>
References: <20210928120933.196571-1-hegdevasant@linux.vnet.ibm.com>
Date: Fri, 01 Oct 2021 16:10:25 +1000
Message-ID: <87r1d5mg1a.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vasant,

> Commit 587164cd, introduced new opal message type (OPAL_MSG_PRD2) and added
> opal notifier. But I missed to unregister the notifier during module unload
> path. This results in below call trace if you try to unload and load
> opal_prd module.
>
> Fixes: 587164cd ("powerpc/powernv: Add new opal message type")

In reviewing this patch, I've become a bit worried the underlying patch
has another issue that we should fix.

Consider opal_prd_probe and the opal_prd_event_nb:

static struct notifier_block opal_prd_event_nb = {
	.notifier_call	= opal_prd_msg_notifier,
	.next		= NULL,
	.priority	= 0,
};

static int opal_prd_probe(struct platform_device *pdev)
{
...
	rc = opal_message_notifier_register(OPAL_MSG_PRD, &opal_prd_event_nb);
	if (rc) { ... }

	rc = opal_message_notifier_register(OPAL_MSG_PRD2, &opal_prd_event_nb);
	if (rc) { ... }

I don't think you can reuse a single notifier block for multiple
notifier_register calls. opal_message_notify_register calls
atomic_notifier_chain_register which takes a spinlock and calls
notifer_chain_register which reads:

static int notifier_chain_register(struct notifier_block **nl,
		struct notifier_block *n)
{
	while ((*nl) != NULL) {
        // ... skip some error detection
        // ... find the right spot in the list to add this
		if (n->priority > (*nl)->priority)
			break;
		nl = &((*nl)->next);
	}
	n->next = *nl; // <-- mutate the notifier block!!
	rcu_assign_pointer(*nl, n);
	return 0;
}

So we have the same notifier block getting inserted into two different
linked lists. This is unlikely to break at the moment because nothing
else registers an MSG_PRD/PRD2 notifier, but nonetheless I think you
need to use a different notifer_block struct for each list you insert
your notifier into.

Likewise this could cause other problems during removal, if there were
other entries in either notifier list.

Kind regards,
Daniel
