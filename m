Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B12CD32A838
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 18:36:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqkpJ5CMLz3cYm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 04:36:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=EUvTb+PE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.142.92; helo=alln-iport-5.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=EUvTb+PE; dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir;
 Wed, 03 Mar 2021 04:36:35 AEDT
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dqknv5sL0z30Ly
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 04:36:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=483; q=dns/txt; s=iport;
 t=1614706596; x=1615916196;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=i+Gz80jPEL08iRfyqDTBuTMykYMo9F/a3XftoJvNPyg=;
 b=EUvTb+PEwm3cYf2dMzSWRKtmwYZDndhz5MWUemBsbYfsTcczLHzk48ai
 cJ7NeK4x6CBEkzq+xytSSMer75nxDVN3z+JgZMcGV0Hx7K3TT2aRO8LUs
 QY9Oz0cqFaGHXjoMcao2ahRapVERw79+r7hOEYKoQyw2gftCo++CdGwIP g=;
X-IPAS-Result: =?us-ascii?q?A0AHAAAVdz5gmIoNJK1iGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQIE+AgEBAQELAYN2ATkxlh2PehaMOwsBAQENAQE0BAEBhE0Cg?=
 =?us-ascii?q?XoCJTcGDgIDAQEBAwIDAQEBAQUBAQECAQYEFAEBAQEBAQEBhkOGRQEFOj8QC?=
 =?us-ascii?q?xguPBsGE4JwgwitBXSBNIkmgUQigRYBjUImHIFJQoQrPogIgisEpDibe4MGg?=
 =?us-ascii?q?R+acjEQgxWgMbZyAgQGBQIWgWoigVkzGggbFYMkUBkNjjiOUCADLzgCBgoBA?=
 =?us-ascii?q?QMJjBMBAQ?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,217,1610409600"; d="scan'208";a="673161766"
Received: from alln-core-5.cisco.com ([173.36.13.138])
 by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 02 Mar 2021 17:35:25 +0000
Received: from zorba ([10.24.9.198])
 by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 122HZNSi008144
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 2 Mar 2021 17:35:25 GMT
Date: Tue, 2 Mar 2021 09:35:23 -0800
From: Daniel Walker <danielwa@cisco.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 0/7] Improve boot command line handling
Message-ID: <20210302173523.GE109100@zorba>
References: <cover.1614705851.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1614705851.git.christophe.leroy@csgroup.eu>
X-Outbound-SMTP-Client: 10.24.9.198, [10.24.9.198]
X-Outbound-Node: alln-core-5.cisco.com
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 02, 2021 at 05:25:16PM +0000, Christophe Leroy wrote:
> The purpose of this series is to improve and enhance the
> handling of kernel boot arguments.
> 
> It is first focussed on powerpc but also extends the capability
> for other arches.
> 
> This is based on suggestion from Daniel Walker <danielwa@cisco.com>
> 


I don't see a point in your changes at this time. My changes are much more
mature, and you changes don't really make improvements.

Daniel
