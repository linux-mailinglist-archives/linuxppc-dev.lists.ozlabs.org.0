Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 256B219CC5B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 23:28:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tbm60r4BzDqTC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 08:28:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=jNKpC5kn; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tbkZ3PB8zDrF2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 08:27:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585862849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nYosSnECcnDnXEwCUr/zQ5HjFFOmJvXZ42i/XsVNG9w=;
 b=jNKpC5kninK1zaeQ4If3A+mothGLBkMOjRo+nhg/qJOjFiQOJFtAUhQQbN8buF7xPj37+5
 QqRSh9AkKU5eIjrkGzw2gA0uoBOa7MAH2m/KIshsaW61K4eHbaLimtuTBGhXy5H/yBt0UR
 AYN9AjhOD1rvEowFnEydV2+3Cpj5nfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-pomMgmzbOCyAw40CTZu6UA-1; Thu, 02 Apr 2020 17:27:25 -0400
X-MC-Unique: pomMgmzbOCyAw40CTZu6UA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 442CD8017F5;
 Thu,  2 Apr 2020 21:27:22 +0000 (UTC)
Received: from krava (unknown [10.40.194.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26AF2196AE;
 Thu,  2 Apr 2020 21:27:08 +0000 (UTC)
Date: Thu, 2 Apr 2020 23:27:04 +0200
From: Jiri Olsa <jolsa@redhat.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v8 0/7]  powerpc/perf: Add json file metric support for
 the hv_24x7 socket/chip level events
Message-ID: <20200402212704.GC2784502@krava>
References: <20200401203340.31402-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401203340.31402-1-kjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

On Thu, Apr 02, 2020 at 02:03:33AM +0530, Kajol Jain wrote:
> Patchset adds json file metric support for the hv_24x7 socket/chip level
> events. "hv_24x7" pmu interface events needs system dependent parameter
> like socket/chip/core. For example, hv_24x7 chip level events needs
> specific chip-id to which the data is requested should be added as part
> of pmu events.
> 
> So to enable JSON file support to "hv_24x7" interface, patchset reads
> total number of sockets details in sysfs under 
> "/sys/devices/hv_24x7/interface/".
> 
> Second patch of the patchset adds expr_scanner_ctx object to hold user
> data for the expr scanner, which can be used to hold runtime parameter.
> 
> Patch 4 & 6 of the patchset handles perf tool plumbing needed to replace
> the "?" character in the metric expression to proper value and hv_24x7
> json metric file for different Socket/chip resources.
> 
> Patch set also enable Hz/hz prinitg for --metric-only option to print
> metric data for bus frequency.
> 
> Applied and tested all these patches cleanly on top of jiri's flex changes
> with the changes done by Kan Liang for "Support metric group constraint"
> patchset and made required changes.
> 
> Also apply this patch on top of the fix patch send earlier
> for printing metric name incase overlapping events.
> https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/commit/?h=perf/core&id=37cd7f65bf71a48f25eeb6d9be5dacb20d008ea6
> 
> Changelog:
> v7 -> v8
> - Add test case for testing parsing of "?" in metric expression
> - Reaname variables name to runtime

Acked-by: Jiri Olsa <jolsa@redhat.com>

thanks,
jirka

