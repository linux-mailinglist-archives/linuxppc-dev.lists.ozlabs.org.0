Return-Path: <linuxppc-dev+bounces-14462-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 827AEC81E18
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 18:24:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFXkW2334z2xQs;
	Tue, 25 Nov 2025 04:24:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=216.40.44.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764005075;
	cv=none; b=bKOuFzWluKld7JTgwZVCGWKjqeHcEnckNRkm0x+ebe5mmq77x/2ZLVZkQ8F7WLMdPwejP/jpiRU/dJ9e7ZVcEQbgL0WNMQttQBMNTHh7RJLvVrxuH1m5TR8U2xEOA/TrIi74Dki2IXUQmKihYEyWXCCG2A0issPP3wMhdKtHG5kKVdL4N0YoqCgV45Au1tX53o6LWw1qOGOqeFSQ+SmQKBaLlrhIFR+4wrGrtT96iyCCLqjxpUrBtkkRlCXxzWuWH16zqpgJJg3HiLtCHmBX9jMVjguVOq55lVv2XQjIcHrse6n1vVmlHRd4iDqqJpj5U0XMx44TN+OTxGGXni/HdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764005075; c=relaxed/relaxed;
	bh=VIFgQ3+VZdLCNpE3XnBxX2jgVCOtYCywCECelacpc3g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NkcolN7tV+UaP7JPvjhadEXTFHCpGdQxgxX3gGE5JaXGZ8YqEzTDY/fKBvo/rMKmwUE51eJrEBXQFFY1d0w9WBlqLSgMQGiiF5N1KKYTJEBa8gD/N6j5a5y+4PiRNxtuOsB0O+GwBrVffvwWI3lV+Smd3UlHDJeMK0/mpbsqSLwxyRGPQJc3AxkT5tUvCMYA9A4lJJN1jH+DgdJYY1AJiBgpnJ7whnyRVNLO0blXbgRkaFtl4Yg/eWYLcDyi0APGpXgCDgjXVhKurk+wnlT1gHnEK0W5vFLHQuwv+zYoANFbrmeka5A4Y4vk/dQKGirUuWrs7B/VOHtkBmSbzxnfRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=216.40.44.16; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org) smtp.mailfrom=goodmis.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=goodmis.org (client-ip=216.40.44.16; helo=relay.hostedemail.com; envelope-from=rostedt@goodmis.org; receiver=lists.ozlabs.org)
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFXkV0gY6z2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 04:24:31 +1100 (AEDT)
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 64CFB1A048E;
	Mon, 24 Nov 2025 17:24:22 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 5D8882002D;
	Mon, 24 Nov 2025 17:24:18 +0000 (UTC)
Date: Mon, 24 Nov 2025 12:24:59 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, mingo@redhat.com, peterz@infradead.org,
 juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
 yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
 pbonzini@redhat.com, seanjc@google.com, kprateek.nayak@amd.com,
 vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
 dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu
Subject: Re: [PATCH 16/17] sysfs: Provide write method for paravirt
Message-ID: <20251124122459.00e86457@gandalf.local.home>
In-Reply-To: <2025112409-rockstar-shortcake-1892@gregkh>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
	<20251119124449.1149616-17-sshegde@linux.ibm.com>
	<2025112409-rockstar-shortcake-1892@gregkh>
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
X-Rspamd-Queue-Id: 5D8882002D
X-Stat-Signature: msosemjfs5izcaa5syr1cacuy4zecxcu
X-Spam-Status: No, score=0.0 required=3.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+PtbfSO8No2VxBfFE9Az28BBPK4aJGwvg=
X-HE-Tag: 1764005058-12337
X-HE-Meta: U2FsdGVkX1/ktXBgKb1HCNd24ocoggejqqOx9ujxbOHAQF/f9Z0mT3GUZZ138NLLZq9eTI1SFSAZUBTvfUIxgCIbQsWqpBgB0pjBdtke0LVt8B3iJDU/W/WvtVXgNPlOqQOXSMI9RDic3YXXGNNdZi9BQKzUKw4Wq5qZ7IJPbY5eBzlrrggJIv7wAyq0N+ekZbLQVGHaJ70hO+oJ+YgRaHx+fbbscKlUSe1X/0I0pRZx3znPySvUX4xcR16RbBr/R7pF5+IfoiALblkr79ii6Pz3zcniWsLslhDReJ8pNTcDk1HIc85agKtqPnylbkge75zmoaUrtA21EKGlSTK9EPp0+Ef7q+WkSORX6pUbawg+kM9xnKFp15261j5BK55l
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 24 Nov 2025 18:04:48 +0100
Greg KH <gregkh@linuxfoundation.org> wrote:

> As you added this to this series, if it is picked up, it WILL be merged
> :(
> 
> Please try a "Nacked-by:" or something else to keep patches from being
> applied.  Or better yet, send them as a totally separate series.

Agreed. But when I do this to a patch in a series, I usually add in subject:

  [PATCH 16/17][DO NOT APPLY!!!] sysfs: Provide write method for paravirt

in order to make it stand out, and not a footnote after the tags.

-- Steve



