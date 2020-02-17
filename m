Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32299161C2A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 21:12:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LwBt3S36zDqGh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2020 07:12:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=joe.lawrence@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Fupp+Cin; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Lw980wm3zDqfb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2020 07:11:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581970261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e8odtFTZCYiWfmn+20f/hTkWgD4uOk5mH7eoCP8r1tc=;
 b=Fupp+Cin2QWXro1bzJe9DN3e7FtGXbqoeDyzQDFeXi83/T0vGpdnJdnfhKsbZODGo6Un0v
 7osV9gLxhxZSPHMhlrJSJlmuE/lMCHBpLMSzj2vYIbsj9q/97oZtjRZjL0L1xAVGlgrMYQ
 Wii1dAeqUhKgyfGZojdymzczo88cDtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-QL9U2nwNMBqo1SfuBfCZkQ-1; Mon, 17 Feb 2020 11:08:58 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B17318A8C80
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 16:08:57 +0000 (UTC)
Received: from redhat.com (dhcp-17-119.bos.redhat.com [10.18.17.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DE7E60BE1;
 Mon, 17 Feb 2020 16:08:53 +0000 (UTC)
Date: Mon, 17 Feb 2020 11:08:52 -0500
From: Joe Lawrence <joe.lawrence@redhat.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: vdso function descriptors (VDS64_HAS_DESCRIPTORS)?
Message-ID: <20200217160852.GA9557@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: QL9U2nwNMBqo1SfuBfCZkQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I was wondering if there was history behind VDS64_HAS_DESCRIPTORS and in
what cases would one want to turn them on?  (Note, I'm assuming they are
an implementation of Function Descriptors. [1])

arch/powerpc/include/asm/vdso.h unsets the macro:

  /* Define if 64 bits VDSO has procedure descriptors */
  #undef VDS64_HAS_DESCRIPTORS

so I don't believe they are ever used by default -- in this case
V_FUNCTION_BEGIN doesn't add to the .opd section with .name, .TOC base,
etc.

Manually setting VDS64_HAS_DESCRIPTORS results in a vdso64.so in which
binutils tools like readelf properly report functions with symbol type
FUNC instead of NOTYPE.

Are there pieces of the build/etc toolchain unprepared for function
descriptors?  I'm just trying to figure out why the code defaults to
unsetting them.

Thanks,

-- Joe


[1] http://refspecs.linuxfoundation.org/ELF/ppc64/PPC-elf64abi.html#FUNC-DE=
S

