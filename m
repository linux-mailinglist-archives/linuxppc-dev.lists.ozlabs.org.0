Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C541CB6B3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 20:07:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JdbS4NsBzDr5Y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 04:07:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=fweimer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=e64V1uOo; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=YIKeScuy; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JdSb6Y6KzDr0D
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 04:01:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588960902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4KnJZqptJ7bWIQFTnBFMgLlZZljmdsRpqDipOGzc+e4=;
 b=e64V1uOo8wSF6HZixNir3ve4td3CT3F+ADFa64VeG4IPHo9f/bALQyBHhVVsCPh4GSDorH
 kUb8BRasRzQTuR43WwB04+nK4B571uLPCfxjlWPuOSvQ1cXd3FreUkERwSyQC54H2tAlrE
 OwsVThCMaoRYTqSLUiaFyHIvDNBf+Vs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588960903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4KnJZqptJ7bWIQFTnBFMgLlZZljmdsRpqDipOGzc+e4=;
 b=YIKeScuy/dsKh50fmF5/G1X7lPRe4mhRbuALkm1jWfeX/Y1uv7aMIT5QRbV/9z992nZw6s
 bS4byyVSr2g49ZeZp13e/P0yceDwsgX5OVkPalqW0SHdLgPstfCUhz+T8t5KLf2BZZrmZL
 CVUr4Ls/gu1eUukpxBVoL69FW2SvhTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-TtcT3JbAOVKRvwqRdpnw9w-1; Fri, 08 May 2020 14:01:40 -0400
X-MC-Unique: TtcT3JbAOVKRvwqRdpnw9w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09FAE1895A28;
 Fri,  8 May 2020 18:01:38 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-113-187.ams2.redhat.com
 [10.36.113.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9C465C297;
 Fri,  8 May 2020 18:01:35 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Sandipan Das <sandipan@linux.ibm.com>
Subject: Re: [PATCH 2/2] selftests: vm: pkeys: Fix powerpc access right updates
References: <cover.1588959697.git.sandipan@linux.ibm.com>
 <cover.1588959697.git.sandipan@linux.ibm.com>
 <5f65cf37be993760de8112a88da194e3ccbb2bf8.1588959697.git.sandipan@linux.ibm.com>
Date: Fri, 08 May 2020 20:01:34 +0200
In-Reply-To: <5f65cf37be993760de8112a88da194e3ccbb2bf8.1588959697.git.sandipan@linux.ibm.com>
 (Sandipan Das's message of "Fri, 8 May 2020 23:19:15 +0530")
Message-ID: <87blmymhkx.fsf@oldenburg2.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: aneesh.kumar@linux.ibm.com, linuxram@us.ibm.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Sandipan Das:

> The Power ISA mandates that all writes to the Authority
> Mask Register (AMR) must always be preceded as well as
> succeeded by a context-synchronizing instruction. This
> applies to both the privileged and unprivileged variants
> of the Move To AMR instruction.

Ugh.  Do you have a reference for that?

We need to fix this in glibc.

Thanks,
Florian

