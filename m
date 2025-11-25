Return-Path: <linuxppc-dev+bounces-14487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D337C85E00
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 17:08:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dG70113kmz2yjm;
	Wed, 26 Nov 2025 03:08:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=216.40.44.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764086897;
	cv=none; b=Boi0vVtL56Dv1qQG4jTFcT5BX+x9dBEveFQyIhAbyruaXyElCCpYi4g3uGIa7+mQXmjkjZXhBwkxRVWrXIH6uhc0qo+5xYZfPADT3KAxphcoCuEch8vYoB8/c53mnUZqSwKy6wIuwUurtjiC8ACweHtwN8TJEWQ6sPe7noyXOE54XsPlNtiRRgjURUnrMgvHCbK+dtpiTJc/KjgeMmE0cLj/nytq5nk1J9/PQv4uRyw9WhgREV5xRsIXSwdY8gcYvCIq7l1o07qVMzLCYyLxgJths3TNXArTHqNaQJ7RQkHqFQcGmqAYyRPGT0c3GSU41VgDnEHRxguR/zrVXoEG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764086897; c=relaxed/relaxed;
	bh=1uZ9aJMN8o+liGdOz8PSQvKGlwIjix+cQvgkEEAnEC4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E+2yI/ASYtGb23wlLwGeeMtA2jXFRFl/MdE5vCRI/TUckVhbMvlWujE5E9Upc+PzIqJpT+Sx/WfmOGjPjgfiGw5w4knP7MTj4y18t8VFalmXf6RFAJlGFwhFhUGDrZtty2gXzQs1RPO3Q+tGj8jSk3qJVDhXdy7FhevDdIQ0AVmqyPrihp6vgf4Lcn4Z4lR0HS9Vrp7XVNPghEBRcQSp0qs/mp6+OorH1g0QGY0EI/YMuI5t79+Ep824JoC/aSEhrtkzv5eS4eEuiZA4dSd38DS7Qv8K9A6rhzbyMHyonHy8YhlJERVVgwV5Wk0exy9lBV+FtdNmXFadCx8bIEiOdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=216.40.44.12; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org) smtp.mailfrom=goodmis.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=goodmis.org (client-ip=216.40.44.12; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org)
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dG6zz4JhPz2xqk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 03:08:14 +1100 (AEDT)
Received: from omf09.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 2C7B1C0261;
	Tue, 25 Nov 2025 16:08:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id A574020024;
	Tue, 25 Nov 2025 16:08:04 +0000 (UTC)
Date: Tue, 25 Nov 2025 11:08:48 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, Greg KH
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
 yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
 pbonzini@redhat.com, seanjc@google.com, kprateek.nayak@amd.com,
 vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
 dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 16/17] sysfs: Provide write method for paravirt
Message-ID: <20251125110848.2230156b@gandalf.local.home>
In-Reply-To: <20251125-heavenly-agile-seahorse-161893@lemur>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
	<20251119124449.1149616-17-sshegde@linux.ibm.com>
	<2025112409-rockstar-shortcake-1892@gregkh>
	<20251124122459.00e86457@gandalf.local.home>
	<e20dee2b-4876-4181-8b45-dc73b61e3202@linux.ibm.com>
	<20251125105218.4a1e02ad@gandalf.local.home>
	<20251125-heavenly-agile-seahorse-161893@lemur>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: A574020024
X-Stat-Signature: bf11hgxuwa5opupdm8ymsgibch41rmsz
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19Y+1lumLSOBqJtLV8dnl4/9WvbDbRXDZ4=
X-HE-Tag: 1764086884-838569
X-HE-Meta: U2FsdGVkX192Mb9Ec0Ls/Ud3+JXQivZ8Xdb26bLdf9lViTrxfGxDsKgheuUUVfVXuZmA7h86h5je+9nSh2tKFnTQ3YJpGIWpclOVgkTv8GEl10MCqhLteN0zlpIyQngye3t4FQXndO5gPvhLyBFSMRA5cizUfrexI5LkW5HWSr/adAYYZ/iKMnv1/HYRPs0y7eFPPIPlg/M8Q+GZfN742gamDH8J+EHW8Eea5kOfoYVUeYbcPUWuHp6uTGLqrxNJL4+GUlpHed5r06wC8m7LENXV/ZhHx5Qr0ezBdqvRE2st4q0dPoNOIjYsQBP100WiRGMtVOwhiiRf4KsOW3DAUoBvJi5C7l/vFnNJ6oh/3nw2AfH8uOu5Qsrd5CKsbPcx
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 25 Nov 2025 11:02:38 -0500
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> Small correction -- it's git itself that strips all content inside [], not b4
> specifically.

Yes of course. Sorry, I didn't want to blame b4. I actually download the
patch series from patchwork and then do git am which does the stripping. I
just wanted to state a more common workflow, which is usually b4 followed
by a blind execution of git am. Where it does the stripping isn't of
importance at that point.

-- Steve

