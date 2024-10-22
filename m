Return-Path: <linuxppc-dev+bounces-2479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBB09A9656
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 04:42:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXc0b0lH6z2yV8;
	Tue, 22 Oct 2024 13:42:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729564959;
	cv=none; b=V99XdQ9Hvg99GVolRPv71vB8LDNd7UuCVyE41i0zRE+JquHxCQ+pNjalL0r+xN+nkC6a0qKoGISaItdqVUuDz6ks2LYCx0xBkLT9zjqaC6D4HfwxjH7wi+hnC+tFsJxxDy1DoHjmt2DSdwjLUIe2JD+ZM8tQOX5WkDXwYvjNrpYeLBMbGZm3o0LOuZOtv95VwJFqybOJrWKAhxzsVDnj3H0FMJ7IszmOlZXR4VHUxsnZDw5K7oRT0g9/oUBcJrt2YDl+zNNDxXPsZF9vRq1fhdskIpj3/ZQT3Tayitm0MvUHXehuLymuL2fbywMY3aSqHQtJQlDsjMvv7C3hTzlRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729564959; c=relaxed/relaxed;
	bh=iA44515hIjaaXQQmGhGyu/wNw6RcsnRKM1ujfj6qVyY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A+fMeCOFoiPduvQ91IJYb2It/DdXNKg+MApkl8hoMcSJwG9hTkqEyabc22iDdpP7oNyYsua1Y6uRRI7V/25u5PSZoOU1OgHxjLa/H8HNPHrztdJcGRgSGbTELnqpM6cVOji1ktq5lMHg9WlNZIaAxwbZ71N5V+Vu7yfZ0sVO4sCwX1SuYAGjhCtw/eKeIdptY0UPEt3k4t0JW5BLrfwfOOSc24VFSjRsfyTasfAjPUCcrUSaOZuVz5KCBL0BOkDFIaDMwTt0hL4QsTdPr8zsHgLM88fRIdPbM8BEsYaUKlXwcj85h6lnB+f5ZNwXA3asBisBM9V5RtPBTCQ2He7P5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EpboXSxj; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EpboXSxj;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXc0Y1Zlqz2yV6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 13:42:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1729564950;
	bh=iA44515hIjaaXQQmGhGyu/wNw6RcsnRKM1ujfj6qVyY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EpboXSxjqS/PjqizIjw89fM7FbMw9k9eMRGAda8Dh3h5WJaC00qYYH+Sc9xGOj3Xb
	 OQVnzGz4pC46jGjNSCSjcSb1noaXHArrpPBGc5EoWSgDuwKucdLVYx6okeea3ZHJdb
	 dEhuDDom6MUz0h5Nrl29ByZLKvCxTafcJJO12TA3b0tDbqCCB/ZuPyCHMsxI8UiQyY
	 47PqCzXPzDiZeovFYOaYrykASRq7TUntUEPiGvS4BEA/4wi8hU86K8ogLi9qgFyEOZ
	 n3pZhmUwVueq9AwQdfJ/YY9T4NhEqlR9PNjZBtPkJFH0E9VS0kfs3dI9VJy0tJyLZ/
	 fPMIE/uRz0srg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XXc0P57pKz4wnr;
	Tue, 22 Oct 2024 13:42:29 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org, Marco Elver
 <elver@google.com>, Alexander Potapenko <glider@google.com>, Heiko
 Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Hari Bathini <hbathini@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom
 <donettom@linux.vnet.ibm.com>, Pavithra Prakash
 <pavrampu@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Disha Goel
 <disgoel@linux.ibm.com>
Subject: Re: [PATCH v3 01/12] powerpc: mm/fault: Fix kfence page fault
 reporting
In-Reply-To: <a411788081d50e3b136c6270471e35aba3dfafa3.1729271995.git.ritesh.list@gmail.com>
References: <cover.1729271995.git.ritesh.list@gmail.com>
 <a411788081d50e3b136c6270471e35aba3dfafa3.1729271995.git.ritesh.list@gmail.com>
Date: Tue, 22 Oct 2024 13:42:29 +1100
Message-ID: <87plnsoo2y.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Ritesh,

"Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:
> copy_from_kernel_nofault() can be called when doing read of /proc/kcore.
> /proc/kcore can have some unmapped kfence objects which when read via
> copy_from_kernel_nofault() can cause page faults. Since *_nofault()
> functions define their own fixup table for handling fault, use that
> instead of asking kfence to handle such faults.
>
> Hence we search the exception tables for the nip which generated the
> fault. If there is an entry then we let the fixup table handler handle the
> page fault by returning an error from within ___do_page_fault().
>
> This can be easily triggered if someone tries to do dd from /proc/kcore.
> dd if=/proc/kcore of=/dev/null bs=1M
>
> <some example false negatives>
> ===============================
> BUG: KFENCE: invalid read in copy_from_kernel_nofault+0xb0/0x1c8
> Invalid read at 0x000000004f749d2e:
>  copy_from_kernel_nofault+0xb0/0x1c8
>  0xc0000000057f7950
>  read_kcore_iter+0x41c/0x9ac
>  proc_reg_read_iter+0xe4/0x16c
>  vfs_read+0x2e4/0x3b0
>  ksys_read+0x88/0x154
>  system_call_exception+0x124/0x340
>  system_call_common+0x160/0x2c4

I haven't been able to reproduce this. Can you give some more details on
the exact machine/kernel-config/setup where you saw this?

cheers

