Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2ED355957
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 18:39:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFCsf24TYz304Y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 02:39:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=exBRtp50;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.95; helo=alln-iport-8.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=exBRtp50; dkim-atps=neutral
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFCsD5gqJz2xfv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 02:38:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=907; q=dns/txt; s=iport;
 t=1617727137; x=1618936737;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Smn0mCx9dbvDRLHtP0dTWqRsaDRXRIB0PRh2q1rD0Lk=;
 b=exBRtp509uZkQhblLqccKzPJTwGNJEYefN+cqIYUIqWbUcqiZpHn1Nt4
 wrnfY+jgdwdgRjTQ0vFejYp+k5GKcyiU8plRBpJUL4Bfk89aFesp64HSv
 0/YRGeTyRS8P3LDjnk3SEwcpD8NEnryfPyjW45zr7Zh4VlZ4xWsH/qFBv o=;
X-IronPort-AV: E=Sophos;i="5.82,310,1613433600"; d="scan'208";a="690319628"
Received: from alln-core-7.cisco.com ([173.36.13.140])
 by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 06 Apr 2021 16:38:52 +0000
Received: from zorba ([10.24.14.212])
 by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 136GcoPb001265
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 6 Apr 2021 16:38:51 GMT
Date: Tue, 6 Apr 2021 09:38:49 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 4/8] CMDLINE: powerpc: convert to generic builtin command
 line
Message-ID: <20210406163849.GT2469518@zorba>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <e51a16e369f6a7dfae948c6de76061f3a061a375.1617126961.git.danielwa@cisco.com>
 <366fd8d3-09c9-8cae-3f10-046c4a643792@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <366fd8d3-09c9-8cae-3f10-046c4a643792@csgroup.eu>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.14.212, [10.24.14.212]
X-Outbound-Node: alln-core-7.cisco.com
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
Cc: ob Herring <robh@kernel.org>, Ruslan Ruslichenko <rruslich@cisco.com>,
 Ruslan Bilovol <rbilovol@cisco.com>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 xe-linux-external@cisco.com, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 02, 2021 at 07:34:19PM +0200, Christophe Leroy wrote:
> 
> 
> Le 30/03/2021 à 19:56, Daniel Walker a écrit :
> > This updates the powerpc code to use the CONFIG_GENERIC_CMDLINE
> > option.
> > 
> > This includes a scripted mass convert of the config files to use
> > the new generic cmdline. There is a bit of a trim effect here.
> > It would seems that some of the config haven't been trimmed in
> > a while.
> 
> Sorry, this patch is not acceptable as is, the default for powerpc is
> CMDLINE_FROM_BOOTLOADER, ie builtin-cmdline is taken if and only if none is
> provided by the bootloader.
> 
> As far as I understand, that disappear with this patch.

We've talked about it previously. Maybe your not understanding the precedent of
the command line options. I tried to explain that one before.

What problems do you think are caused if this patch is applied ?

Daniel
