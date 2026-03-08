Return-Path: <linuxppc-dev+bounces-17871-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id X6BTEc/5rWmE+QEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17871-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 08 Mar 2026 23:35:59 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 399A62327AD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 08 Mar 2026 23:35:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fTZjl4FHBz3bf8;
	Mon, 09 Mar 2026 09:35:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.121.94.185
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773006486;
	cv=none; b=n6B+UOGWH/qVA9tfvjYlkTWa2i2mv5ddwbA+Sr+wMWT904n3Y6a9Y3Ad8ROOj0A0HhbUte3MMd0TlmWWLGwCgJucN33CIYK/lTqbODUx7y2AjsrHcqR0TWzhLgRSh5UfPA9p7WNDJWR0rVbdSVb3RpVrG+IV42CpkKZQXFIg3Zyl404cdoL8n/OE0ZAwdpz1WtXpNxtxT25qqtqBwj1oFqQAjO2fAdaFuWL5kkV0ExBc0YvM9RMa4dh2IC9QxkDZjeLPw6DXuTaV0kgNSrd841Brc3JiwoGpxMT0VgRBo+bKZE8FecvcZf/cby1DWQuyt3TghMXInvphibRpO7H72Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773006486; c=relaxed/relaxed;
	bh=d0nM3NMJSApSZY/BYBveAOgnRj3sO/ez5p7n6+qLOOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f4M+su74qfLltAosHn4DccLHcULxHpAur1Uc3ro2vybCklTcz/pmrYwqNHXtTsYFXXwGmU1N/2QtTVHQst6szwBL1NXst4b8iZtkgYLcMANgA+WcCT64ZZhMuSn06z0WDyBCkPPGg594tBrXLlTb8cogLG4C+38p/bvDXwjgiry5t9osT6PBnCQp8SQbrrhs5HRANJm0skDyR058KS+N9CmADoaRYPguVakW/gn3kUA3/odiOM/Tl7vyzUQyCYYJGwrrn6Mt4NhqcIeFalCms5hFtxrNDtoebZXQViGjPG3S8b0jaCWy9om9ETAFE80OuAmHFGhPA4SdzItLnW4nAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=Rf+iXjLc; dkim-atps=neutral; spf=pass (client-ip=195.121.94.185; helo=ewsoutbound.kpnmail.nl; envelope-from=jkoolstra@xs4all.nl; receiver=lists.ozlabs.org) smtp.mailfrom=xs4all.nl
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=xs4all.nl header.i=@xs4all.nl header.a=rsa-sha256 header.s=xs4all01 header.b=Rf+iXjLc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=xs4all.nl (client-ip=195.121.94.185; helo=ewsoutbound.kpnmail.nl; envelope-from=jkoolstra@xs4all.nl; receiver=lists.ozlabs.org)
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fTYfW1d3Zz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 08:48:01 +1100 (AEDT)
X-KPN-MessageId: 42ca8ed2-1b38-11f1-8ff1-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 42ca8ed2-1b38-11f1-8ff1-005056999439;
	Sun, 08 Mar 2026 22:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=mime-version:message-id:date:subject:to:from;
	bh=d0nM3NMJSApSZY/BYBveAOgnRj3sO/ez5p7n6+qLOOw=;
	b=Rf+iXjLcAZ8xqz1QQinSmc7qqgH0eeMgzD8YNSOji4HLLk5YE+PqhbhebKKSA1VQ/5abjAZMzBG84
	 e+0V2WCjLT4QK2VKeoz4memJvL55aESvAX8TNhRdDtUbzRDkfHGR/7sTWljvLUIsUjL2SvHe9yqyi0
	 Am9cwQyJjOWQziXeULGcqFRMebftcOptXJ6YWoacccC3JKkgmutlley56ZPrfwL3e68TJ94RtQG7Vd
	 y+9lsuhpB4aXNVqWjieahXI55TKtFTiNveA+FMBceRvYBIm5u3pbHlhS8Cw4urS/Fx7Wei6YgFmmOt
	 jcL3DkurO6n+lkgzq3DiHveKfo02GgA==
X-KPN-MID: 33|fnxeyDsQwFoawVkoO51YnO6zb17fsq4BeGwRvBKyWYwlzNmyg2ABJNisDpFIEkb
 ka1QMb1yarTAemgkQncLth+IL5cr02jQftpxOKqSqqJE=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|X4Tob/CwPUbF9QQyL6HjZu3JD40t82EpG/0VlQ7+ibTG4xEWsluC4ewC5l8U1CC
 Td66ySa0CJyLa1OEikWK+RQ==
X-Originating-IP: 178.229.142.230
Received: from daedalus.home (unknown [178.229.142.230])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 3f797210-1b38-11f1-9c04-00505699d6e5;
	Sun, 08 Mar 2026 22:46:27 +0100 (CET)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: gregkh@linuxfoundation.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>,
	Haren Myneni <haren@linux.ibm.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Jonathan Greental <yonatan02greental@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] powerpc: vas-api: constify dynamic struct class in coproc api register
Date: Sun,  8 Mar 2026 22:46:31 +0100
Message-ID: <20260308214634.1215051-1-jkoolstra@xs4all.nl>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 399A62327AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[xs4all.nl,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[xs4all.nl:s=xs4all01];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:jkoolstra@xs4all.nl,m:haren@linux.ibm.com,m:srikar@linux.ibm.com,m:yonatan02greental@gmail.com,m:kees@kernel.org,m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[jkoolstra@xs4all.nl,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[xs4all.nl];
	FREEMAIL_TO(0.00)[linuxfoundation.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17871-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[xs4all.nl:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jkoolstra@xs4all.nl,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[xs4all.nl,linux.ibm.com,gmail.com,kernel.org,lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xs4all.nl:dkim,xs4all.nl:email,xs4all.nl:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

The class_create() call has been deprecated in favor of class_register()
as the driver core now allows for a struct class to be in read-only
memory.

In vas_register_coproc_api() the dynamic allocation of the struct class
corresonding to the coprocessor type (right now only nx-gzip) is
replaced by calling

	static const struct class* cop_to_class(enum vas_cop_type cop)

which links the coprocessor type to the appropriate static const struct
class.

Compile tested only.

Link: https://lore.kernel.org/all/2023040244-duffel-pushpin-f738@gregkh/

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Jori Koolstra <jkoolstra@xs4all.nl>
---
v2: undo whitespace removal

 arch/powerpc/platforms/book3s/vas-api.c | 34 +++++++++++++++++++------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index ea4ffa63f043..e377981fd533 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -45,7 +45,7 @@ static struct coproc_dev {
 	struct device *device;
 	char *name;
 	dev_t devt;
-	struct class *class;
+	const struct class *class;
 	enum vas_cop_type cop_type;
 	const struct vas_user_win_ops *vops;
 } coproc_device;
@@ -599,6 +599,21 @@ static struct file_operations coproc_fops = {
 	.unlocked_ioctl = coproc_ioctl,
 };
 
+static const struct class nx_gzip_class = {
+	.name		= "nx-gzip",
+	.devnode	= coproc_devnode
+};
+
+static const struct class* cop_to_class(enum vas_cop_type cop)
+{
+	switch (cop) {
+	case VAS_COP_TYPE_GZIP:		return &nx_gzip_class;
+	default:
+		pr_err("No device class defined for cop type %d\n", cop);
+		return NULL;
+	}
+}
+
 /*
  * Supporting only nx-gzip coprocessor type now, but this API code
  * extended to other coprocessor types later.
@@ -609,6 +624,10 @@ int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
 {
 	int rc = -EINVAL;
 	dev_t devno;
+	const struct class* class = cop_to_class(cop_type);
+
+	if (!class)
+		return rc;
 
 	rc = alloc_chrdev_region(&coproc_device.devt, 1, 1, name);
 	if (rc) {
@@ -619,13 +638,12 @@ int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
 	pr_devel("%s device allocated, dev [%i,%i]\n", name,
 			MAJOR(coproc_device.devt), MINOR(coproc_device.devt));
 
-	coproc_device.class = class_create(name);
-	if (IS_ERR(coproc_device.class)) {
-		rc = PTR_ERR(coproc_device.class);
-		pr_err("Unable to create %s class %d\n", name, rc);
+	rc = class_register(class);
+	if (rc) {
+		pr_err("Unable to register %s class %d\n", name, rc);
 		goto err_class;
 	}
-	coproc_device.class->devnode = coproc_devnode;
+	coproc_device.class = class;
 	coproc_device.cop_type = cop_type;
 	coproc_device.vops = vops;
 
@@ -654,7 +672,7 @@ int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
 err:
 	cdev_del(&coproc_device.cdev);
 err_cdev:
-	class_destroy(coproc_device.class);
+	class_unregister(coproc_device.class);
 err_class:
 	unregister_chrdev_region(coproc_device.devt, 1);
 	return rc;
@@ -668,6 +686,6 @@ void vas_unregister_coproc_api(void)
 	devno = MKDEV(MAJOR(coproc_device.devt), 0);
 	device_destroy(coproc_device.class, devno);
 
-	class_destroy(coproc_device.class);
+	class_unregister(coproc_device.class);
 	unregister_chrdev_region(coproc_device.devt, 1);
 }

base-commit: d466c332e106fe666d1e2f5a24d08e308bebbfa1
-- 
2.53.0


