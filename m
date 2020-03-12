Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C358182E5F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 11:56:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dQkW6SX4zDqg8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 21:56:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=jolsa@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=hoKCJce5; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dQd959tszDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 21:52:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584010330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R+E7IwCKDlOkibK9pQlSg0fG3D+6SSYGlZXYefrXYlo=;
 b=hoKCJce5IQ2vmNnS4FTcx9dou0AcfZGETWc1SIuhNiMrxjJIwJC6+CAuYGnTw6EbDM5ZjB
 0r+vXSQObrrTv1h0ld5bvA/jMpUX3ffs1/yfvAlEyp5xLPXJrHA2Y42WhHQ3eN+PN0XtHh
 aAQWG/7E5AzQz50fu9k8ZhJsvgk+DJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-N6K3NEdRMl6BFcClDJVGsQ-1; Thu, 12 Mar 2020 06:52:06 -0400
X-MC-Unique: N6K3NEdRMl6BFcClDJVGsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5CDC800D48;
 Thu, 12 Mar 2020 10:52:02 +0000 (UTC)
Received: from krava (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDC3060BF1;
 Thu, 12 Mar 2020 10:51:55 +0000 (UTC)
Date: Thu, 12 Mar 2020 11:51:45 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH v4 6/8] perf/tools: Enhance JSON/metric infrastructure to
 handle "?"
Message-ID: <20200312105145.GC311223@krava>
References: <20200309062552.29911-1-kjain@linux.ibm.com>
 <20200309062552.29911-7-kjain@linux.ibm.com>
 <20200310183455.GB12036@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310183455.GB12036@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 sukadev@linux.vnet.ibm.com, ravi.bangoria@linux.ibm.com,
 Kajol Jain <kjain@linux.ibm.com>, jmario@redhat.com, namhyung@kernel.org,
 tglx@linutronix.de, mpetlan@redhat.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 10, 2020 at 03:34:55PM -0300, Arnaldo Carvalho de Melo wrote:

SNIP

> > diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
> > index 3b4cdfc5efd6..036f6b2ce202 100644
> > --- a/tools/perf/arch/powerpc/util/header.c
> > +++ b/tools/perf/arch/powerpc/util/header.c
> > @@ -7,6 +7,11 @@
> >  #include <string.h>
> >  #include <linux/stringify.h>
> >  #include "header.h"
> > +#include "metricgroup.h"
> > +#include "evlist.h"
> > +#include <dirent.h>
> > +#include "pmu.h"
> > +#include <api/fs/fs.h>
> >  
> >  #define mfspr(rn)       ({unsigned long rval; \
> >  			 asm volatile("mfspr %0," __stringify(rn) \
> > @@ -16,6 +21,8 @@
> >  #define PVR_VER(pvr)    (((pvr) >>  16) & 0xFFFF) /* Version field */
> >  #define PVR_REV(pvr)    (((pvr) >>   0) & 0xFFFF) /* Revison field */
> >  
> > +#define SOCKETS_INFO_FILE_PATH "/devices/hv_24x7/interface/"
> > +
> >  int
> >  get_cpuid(char *buffer, size_t sz)
> >  {
> > @@ -44,3 +51,18 @@ get_cpuid_str(struct perf_pmu *pmu __maybe_unused)
> >  
> >  	return bufp;
> >  }
> > +
> > +int arch_get_runtimeparam(void)
> > +{
> > +	int count;
> > +	char path[PATH_MAX];
> > +	char filename[] = "sockets";
> > +
> > +	snprintf(path, PATH_MAX,
> > +		 SOCKETS_INFO_FILE_PATH "%s", filename);

also, what's the point of using snprintf in here?

jirka

