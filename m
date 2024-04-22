Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494408AC688
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 10:16:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M62Y1IbU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M62Y1IbU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNJ4V74CTz3ckl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 18:16:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M62Y1IbU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M62Y1IbU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=fweimer@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNJ3j5PsTz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 18:16:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713773755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n7pj1YX0zvZoJ4fszFdVU7DclyCmRGFDahad/XyHzlU=;
	b=M62Y1IbUIJcJTlCstGU3ao/cKPu+FJqAB9Ouclo25cKJe3Cj/+Nmw3JQj9bAGZTl7INmvD
	4YNqbKmp4Yf7ZkNx9qeq6oNbthCHzg61G4Zn4LFJRaMHLrsAM/Xat94syqxkCKIdhJ14Um
	lgr4uMGDpnrYcmRpjuS28eDOozG28Lw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713773755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n7pj1YX0zvZoJ4fszFdVU7DclyCmRGFDahad/XyHzlU=;
	b=M62Y1IbUIJcJTlCstGU3ao/cKPu+FJqAB9Ouclo25cKJe3Cj/+Nmw3JQj9bAGZTl7INmvD
	4YNqbKmp4Yf7ZkNx9qeq6oNbthCHzg61G4Zn4LFJRaMHLrsAM/Xat94syqxkCKIdhJ14Um
	lgr4uMGDpnrYcmRpjuS28eDOozG28Lw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-619-J11HdeYyNCS4_-jfjacDCA-1; Mon,
 22 Apr 2024 04:15:50 -0400
X-MC-Unique: J11HdeYyNCS4_-jfjacDCA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34D1B29AA2CD;
	Mon, 22 Apr 2024 08:15:49 +0000 (UTC)
Received: from oldenburg3.str.redhat.com (unknown [10.39.194.90])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD1AA43FAD;
	Mon, 22 Apr 2024 08:15:45 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Vignesh Balasubramanian <vigbalas@amd.com>
Subject: Re: [PATCH 1/1] Replace macro "ARCH_HAVE_EXTRA_ELF_NOTES" with kconfig
In-Reply-To: <20240412062138.1132841-2-vigbalas@amd.com> (Vignesh
	Balasubramanian's message of "Fri, 12 Apr 2024 11:51:39 +0530")
References: <20240412062138.1132841-1-vigbalas@amd.com>
	<20240412062138.1132841-2-vigbalas@amd.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Mon, 22 Apr 2024 10:15:44 +0200
Message-ID: <874jbt7qz3.fsf@oldenburg3.str.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@FreeBSD.org, bpetkov@amd.com, binutils@sourceware.org, x86@kernel.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, linux-mm@kvack.org, npiggin@gmail.com, linux-toolchains@vger.kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Vignesh Balasubramanian:

> diff --git a/include/linux/elf.h b/include/linux/elf.h
> index c9a46c4e183b..5c402788da19 100644
> --- a/include/linux/elf.h
> +++ b/include/linux/elf.h
> @@ -65,7 +65,7 @@ extern Elf64_Dyn _DYNAMIC [];
>  struct file;
>  struct coredump_params;
>  
> -#ifndef ARCH_HAVE_EXTRA_ELF_NOTES
> +#ifndef CONFIG_ARCH_HAVE_EXTRA_ELF_NOTES

You could add

  #pragma GCC poison ARCH_HAVE_EXTRA_ELF_NOTES

to a central header, to let GCC and Clang flag uses that have not been
converted.

Thanks,
Florian

