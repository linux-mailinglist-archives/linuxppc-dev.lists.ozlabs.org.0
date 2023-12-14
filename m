Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 399A48124CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 02:52:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I6bIRpyE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I6bIRpyE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrFjg6tH4z3cWF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 12:52:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I6bIRpyE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I6bIRpyE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrFhs4r6mz30ft
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 12:52:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702518729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9AXXFjkdvphmQ1MZVdZxrm1IU4YccGEU/JmOtXsDs6c=;
	b=I6bIRpyE65psx+Bl8XImx67hw1bJSsib8tcr0xy4Vb7njkupHw28a0cwoRkHebNX6F4HI0
	7+8EUs1hI9+u1ytvZZd2EBBg/pdfTL7Bag3u1MlYzNOiVUG7CrNAibwyX+rFQVtVYpVi/w
	VJmkLl5qr0msNSg4HylEvSaqnT0rYe8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702518729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9AXXFjkdvphmQ1MZVdZxrm1IU4YccGEU/JmOtXsDs6c=;
	b=I6bIRpyE65psx+Bl8XImx67hw1bJSsib8tcr0xy4Vb7njkupHw28a0cwoRkHebNX6F4HI0
	7+8EUs1hI9+u1ytvZZd2EBBg/pdfTL7Bag3u1MlYzNOiVUG7CrNAibwyX+rFQVtVYpVi/w
	VJmkLl5qr0msNSg4HylEvSaqnT0rYe8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-FawC5tQhPU2pB8SQSY2xmw-1; Wed, 13 Dec 2023 20:52:05 -0500
X-MC-Unique: FawC5tQhPU2pB8SQSY2xmw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A21685A588;
	Thu, 14 Dec 2023 01:52:04 +0000 (UTC)
Received: from [10.22.33.1] (unknown [10.22.33.1])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 017AD492BF0;
	Thu, 14 Dec 2023 01:52:02 +0000 (UTC)
Message-ID: <ff0c735e-9e8e-4f26-96eb-3927c26e1e01@redhat.com>
Date: Wed, 13 Dec 2023 20:52:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/11] locking: add define if mutex_destroy() is not an
 empty function
Content-Language: en-US
To: George Stark <gnstark@salutedevices.com>, andy.shevchenko@gmail.com,
 pavel@ucw.cz, lee@kernel.org, vadimp@nvidia.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, hdegoede@redhat.com,
 mazziesaccount@gmail.com, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, boqun.feng@gmail.com, nikitos.tr@gmail.com
References: <20231213223020.2713164-1-gnstark@salutedevices.com>
 <20231213223020.2713164-3-gnstark@salutedevices.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20231213223020.2713164-3-gnstark@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
Cc: kernel@salutedevices.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 12/13/23 17:30, George Stark wrote:
> mutex_destroy() is only a debug helper and an empty function on non-debug
> configurations still we can't legally ignore it because it's the
> established API call and it can be extended theoretically in the future.
> Sometimes it could be useful to know e.g. in the higher-level API if
> mutex_destroy() really does something in the current configuration
> and it's should be called or skipped otherwise for the sake of
> optimization so add dedicated define to recognize these cases.
>
> Signed-off-by: George Stark <gnstark@salutedevices.com>
> ---
>   include/linux/mutex.h | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index a33aa9eb9fc3..2395ce4fcaf6 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -83,6 +83,9 @@ struct mutex {
>   
>   extern void mutex_destroy(struct mutex *lock);
>   
> +/* mutex_destroy() is a real function, not a NOP */
> +#define mutex_destroy  mutex_destroy
> +
>   #else
>   
>   # define __DEBUG_MUTEX_INITIALIZER(lockname)
Acked-by: Waiman Long <longman@redhat.com>

