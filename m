Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6965119C18B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 14:55:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tNN60jFKzDqTn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 23:55:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PxF8Gb9R; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tNFT3fH6zDrRJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 23:50:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585831801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CBJyPLqFGhbd2JdWD+WaRlQquIJw7j0X5AJyxZsJMXo=;
 b=PxF8Gb9RIv2zFmjp9dGiX0EwyKCxFrYUEFWpJEV6UTlQhPR1iog3HUDMZY+r51VHYyAOMk
 mElVBdMbJrIf+HBqTrPzEqpEz0ZpTE7SjwAeuX0HZ8MBfVD7lTHKi2yBx27rPd4sFTk8du
 lXMOC63TcHtJGlqymRBss9M6jETRYTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-WChm82hsORS-s5OYgxip1A-1; Thu, 02 Apr 2020 08:49:57 -0400
X-MC-Unique: WChm82hsORS-s5OYgxip1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C82F85EE6C;
 Thu,  2 Apr 2020 12:49:54 +0000 (UTC)
Received: from krava (unknown [10.40.194.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 031A45C290;
 Thu,  2 Apr 2020 12:49:48 +0000 (UTC)
Date: Thu, 2 Apr 2020 14:49:46 +0200
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v8 6/7] tools/perf: Enable Hz/hz prinitg for
 --metric-only option
Message-ID: <20200402124946.GH2518490@krava>
References: <20200401203340.31402-1-kjain@linux.ibm.com>
 <20200401203340.31402-7-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401203340.31402-7-kjain@linux.ibm.com>
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 yao.jin@linux.intel.com, mingo@kernel.org, kan.liang@linux.intel.com,
 ak@linux.intel.com, alexander.shishkin@linux.intel.com,
 anju@linux.vnet.ibm.com, mamatha4@linux.vnet.ibm.com,
 sukadev@linux.vnet.ibm.com, ravi.bangoria@linux.ibm.com, acme@kernel.org,
 jmario@redhat.com, namhyung@kernel.org, tglx@linutronix.de, mpetlan@redhat.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 02, 2020 at 02:03:39AM +0530, Kajol Jain wrote:
> Commit 54b5091606c18 ("perf stat: Implement --metric-only mode")
> added function 'valid_only_metric()' which drops "Hz" or "hz",
> if it is part of "ScaleUnit". This patch enable it since hv_24x7
> supports couple of frequency events.
> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  tools/perf/util/stat-display.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
> index 9e757d18d713..679aaa655824 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -237,8 +237,6 @@ static bool valid_only_metric(const char *unit)
>  	if (!unit)
>  		return false;
>  	if (strstr(unit, "/sec") ||
> -	    strstr(unit, "hz") ||
> -	    strstr(unit, "Hz") ||

will this change output of --metric-only for some setups then?

Andi, are you ok with this?

other than this, the patchset looks ok to me

thanks,
jirka

>  	    strstr(unit, "CPUs utilized"))
>  		return false;
>  	return true;
> -- 
> 2.21.0
> 

