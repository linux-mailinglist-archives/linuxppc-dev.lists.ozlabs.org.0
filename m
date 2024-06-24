Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DDA9158D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 23:25:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tz+gFrvu;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=HbupGoOK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W7Lb46N1Nz3ckk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 07:25:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tz+gFrvu;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=HbupGoOK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 90560 seconds by postgrey-1.37 at boromir; Tue, 25 Jun 2024 07:24:25 AEST
Received: from galois.linutronix.de (unknown [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W7LZK332zz3cXN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 07:24:25 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1719264251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gr9WmSDhp5Pq84URL18JMexmAFXY3Csonubc3aMd8lQ=;
	b=tz+gFrvuToWeWpYe3wCQRoEcGse3at8VZEQyWQ+k+EUUb9IDzCHDvlh5yB1X+rj0YIhB8a
	HDBowP0IhCwJvGaicP02fjiXkRhuE6XhdUVdKiijkXqiy1DevLf+2+Lut0qCizemB7iAS9
	j0eOQ3WSDJwJeowJT+ZOPAn39opOo04EwGlEpRv+KaOjhSlbryRHGOPcy3gIp54gIDI7LL
	P+wLu0ktQQ1w/Ej20YAQrqFAWnWmm+hE5kI+JCIqzlylbi1JTVwHX6EIe6MuvoR8rryOPT
	xlzHEcAJrMQe3wKjJ7Pp9dyDvgnoJNpfp9IbsAs10w5EEf4rtC6o8GvZfqQyJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1719264251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gr9WmSDhp5Pq84URL18JMexmAFXY3Csonubc3aMd8lQ=;
	b=HbupGoOKwbs9B4LuupdDTvFxud2EW+UdhYv4hV27FKPOE5Ux6NByLKP9JG1pXAzXqms4gu
	XgyAEEpj2K63AyAw==
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: Re: [PATCH 0/2] Skip offline cores when enabling SMT on PowerPC
In-Reply-To: <11f9cc04-91eb-4a70-9ff0-5c6f24483cd3@linux.ibm.com>
References: <20240612185046.1826891-1-nysal@linux.ibm.com>
 <875xudoz4d.fsf@mail.lhotse> <87ikxza01w.ffs@tglx>
 <11f9cc04-91eb-4a70-9ff0-5c6f24483cd3@linux.ibm.com>
Date: Mon, 24 Jun 2024 23:24:11 +0200
Message-ID: <87sex26nlw.ffs@tglx>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, "Nysal Jan K.A." <nysal@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25 2024 at 00:41, Shrikanth Hegde wrote:
> On 6/24/24 1:44 AM, Thomas Gleixner wrote:
>> Right. So changing it not to online a thread when the full core is
>> offline should not really break stuff.
>> 
>> OTH, the mechanism to figure that out on x86 is definitely different and
>> more complicated than on power because the sibling threads are not
>> having consecutive CPU numbers.
>
> wouldn't topology_sibling_cpumask have this info? 
> If the mask is empty does it mean the core is offline? 

The mask is not yet available for the to be brought up CPU. That's
established when the CPU boots. It might work because all threads are
brought up during early boot for !~*&^!@% reasons, but then it won't
work under all circumstances, e.g. 'maxcpus=$N'.

We could fix that now with the new topology enumeration code, but that's
a larger scale project.

Thanks,

        tglx
