Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F32D33C9D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 00:19:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzsnH15Q9z30B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 10:19:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eGS3t9M1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eGS3t9M1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=eGS3t9M1; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=eGS3t9M1; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzsmp4TWjz2yy6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 10:18:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615850325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/etmbsJvEZM1gH5LxhcUF9EBSBfjTJ2W2V26uLuorFI=;
 b=eGS3t9M1FiZLC9wVttK4WtAiogBt6S01TtoxMzv0Y9LfbKbgFQcUp2oGettssnqUfFEO9Y
 yZ0GGFnEUj/dJQHEamWjSeSZHxGES+zUDUKgKuFF3Bvrvjb0I7YKUzl05/4xrX1fman02Z
 G8MGWY5KWm/a/S4PEV0KYsocx8D0fzY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615850325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/etmbsJvEZM1gH5LxhcUF9EBSBfjTJ2W2V26uLuorFI=;
 b=eGS3t9M1FiZLC9wVttK4WtAiogBt6S01TtoxMzv0Y9LfbKbgFQcUp2oGettssnqUfFEO9Y
 yZ0GGFnEUj/dJQHEamWjSeSZHxGES+zUDUKgKuFF3Bvrvjb0I7YKUzl05/4xrX1fman02Z
 G8MGWY5KWm/a/S4PEV0KYsocx8D0fzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-WG_tzQXgMfORg1YNpVn6og-1; Mon, 15 Mar 2021 19:18:40 -0400
X-MC-Unique: WG_tzQXgMfORg1YNpVn6og-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE28F814270;
 Mon, 15 Mar 2021 23:18:38 +0000 (UTC)
Received: from krava (unknown [10.40.196.50])
 by smtp.corp.redhat.com (Postfix) with SMTP id 5EC555C3E6;
 Mon, 15 Mar 2021 23:18:36 +0000 (UTC)
Date: Tue, 16 Mar 2021 00:18:35 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/4] tools/perf: Support pipeline stage cycles for powerpc
Message-ID: <YE/rS5jZLA0RHYZG@krava>
References: <1615298640-1529-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1615298640-1529-5-git-send-email-atrajeev@linux.vnet.ibm.com>
 <YEtlEyb2z33qHhvO@krava>
 <FD9505E3-8CDE-4073-88A0-BCA4B92F276E@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FD9505E3-8CDE-4073-88A0-BCA4B92F276E@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, kjain@linux.ibm.com,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 15, 2021 at 01:22:09PM +0530, Athira Rajeev wrote:

SNIP

> +
> +static char *setup_dynamic_sort_keys(char *str)
> +{
> +	unsigned int j;
> +
> +	if (sort__mode == SORT_MODE__MEMORY)
> +		for (j = 0; j < ARRAY_SIZE(dynamic_sort_keys_mem); j++)
> +			if (arch_support_dynamic_key(dynamic_sort_keys_mem[j])) {
> +				str = suffix_if_not_in(dynamic_sort_keys_mem[j], str);
> +				if (str == NULL)
> +					return str;
> +			}
> +
> +	return str;
> +}
> +
>  static int __setup_sorting(struct evlist *evlist)
>  {
>  	char *str;
> @@ -3050,6 +3085,12 @@ static int __setup_sorting(struct evlist *evlist)
>  		}
>  	}
>  
> +	str = setup_dynamic_sort_keys(str);
> +	if (str == NULL) {
> +		pr_err("Not enough memory to setup dynamic sort keys");
> +		return -ENOMEM;
> +	}

hum, so this is basicaly overloading the default_mem_sort_order for
architecture, right?

then I think it'd be easier just overload default_mem_sort_order directly

I was thinking more about adding extra (arch specific) loop to
sort_dimension__add or somehow add arch's specific stuff to
memory_sort_dimensions

jirka

