Return-Path: <linuxppc-dev+bounces-4642-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AC6A00C17
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 17:32:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPpyk6XQqz30Tc;
	Sat,  4 Jan 2025 03:32:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735921966;
	cv=none; b=RT7/d14dQf2tnLKi8qM0RrusOMZ5tjTF2mvDdfspfEP4D18U2kpc/uya0ibTwaSTgMyGu8v8f1o4JyWHPSpD6dsN5h8rFbXuq9TnWQjU4MVH/PnzT4LU5BR/Ji42BybbZBi5UZPzOMEDLoDSPzpWjJVCQHR+fLDLD7Z/E13/6XyB7F0LhfsAUKXGz3eCRw+/xt/+lTDJl/DzWaMg5Rp332R47Ou96tXEm3FxUE+CifQADBeei67TxZObJ4zqjj3IpjVO8wTPNO2Cjw9cZmnDLNG+va8VKdJXiz311wL84/CvFUyjqhj5cRImhV7cN/aucgGKshLxHXW2LFCekeZTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735921966; c=relaxed/relaxed;
	bh=aqmXB2+iWftF33frSLOmIqtwmo0DcpU8occRaU5z+bk=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTY6adubc42rKJ0TcvYP+thM0j7jo+DFtBqnUL2ENrBKS9FjKroU/LaLFxwnXqs9Ux6wGhx+iA4KWl7pqan6HmXeuMPh4RdfgDYX2FUaM50Yc/ai7mbaf+akRD4ZKL/cVFNtMOL1r3mJct5VDniv5dghmC7dsftWWYF8DOHSK0WS2Gec2Omn7VqlWmg41HvJA3kHtix8hZjo3l01dNrZgKOCu8dDAIBMG7gUBgeobIBOA6Y/HUtPWrV0nEK7rzVTE/ritD7Z2BG74OW05//gCdjIzG2wAOODbqT+Yf6Jvc9Q7PGDR6hLvlSDUTeLD/1xymlY+Fl5z+PSHOTp9SQR6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPpyj1cxKz30TS
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 03:32:42 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YPpsT6k8Kz6K61T;
	Sat,  4 Jan 2025 00:28:13 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E92261402DB;
	Sat,  4 Jan 2025 00:32:35 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 3 Jan
 2025 17:32:35 +0100
Date: Fri, 3 Jan 2025 16:32:33 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Atharva Tiwari <evepolonium@gmail.com>
CC: <bhelgaas@google.com>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<mahesh@linux.ibm.com>, <oohall@gmail.com>
Subject: Re: [PATCH] PCI/AER:Add error message when unable to handle
 additional devices
Message-ID: <20250103163233.00006683@huawei.com>
In-Reply-To: <20250103132035.1653-1-evepolonium@gmail.com>
References: <20241227071910.1719-1-evepolonium@gmail.com>
	<20250103132035.1653-1-evepolonium@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri,  3 Jan 2025 18:50:35 +0530
Atharva Tiwari <evepolonium@gmail.com> wrote:

> i completed the todo on line 886 thats why
> 

It is a question, not a todo.  So if you wish to
make the change you need to discuss why the answer to that
question was 'yes it makes sense to print an error message here'.

Jonathan

