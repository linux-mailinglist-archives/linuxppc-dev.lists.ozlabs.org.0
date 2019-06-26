Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEE655F75
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 05:18:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YSt33kWnzDqYq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 13:18:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vn60NhOU"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YSrH3NXTzDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 13:17:19 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id k20so1756225ios.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 20:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iDaxZ2oDFXNBAYZ6jhw0j4lVi52hkng3WRc/YvzdVwE=;
 b=Vn60NhOUJkgNWfEmAKAdnlFhjODRzjbKpbVP1VYlTFROZS5HGKT47e1xysVPJIcfTA
 pZ4oCo8gN+pz4ZONVKQrOV74bbWTPYbMpvcCgCujIz5KoqV+7hPqHWDCWZPU2dnxigge
 dDsDktlVpKoRTtgK5vagMUZWgx6EksxkATpAOl2aeaO7EW4a3q5hZ5paqkdT89+uvnnH
 zliNq5bBESwmynHwLG7efjTFsVfyv2+szp6qdaUH/oVO/hpyPy5gQ7regezYb4cTS0cF
 mg42MkZlUWzjRv+iGnUAs7/oY0LqMWyvrdPrIwtNfyBMWdOsENfNp0CnT46+bjiP3Oa3
 ereg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iDaxZ2oDFXNBAYZ6jhw0j4lVi52hkng3WRc/YvzdVwE=;
 b=dJLznwShxuncNAg4BsEyj+wlCWUI2NYwNyI7um6MCximhhlTABkgslcvwLNwVPAZCV
 PMuGkLRjQPqmaoZdcUYhH+m4MB94fAa0s9l2hHspP5SzV9uPItIgWYejL+o8+y3IUBxu
 16/vBAcNgRLbshj0DpOUoo3dZ+g+/jfWU7skFBKsrpyCJSaEhhE9nSrXvUZbD6LLGDD7
 4lBXlONcHK0zV/BKt+RnH2ZF2d5cHHuRrwghxKc6FSZpiM2oXWfAm6fVbN2dwT2JWH0+
 IR8z9a6/CUFBK5XbZrjqxC8BWi/pwubVU84PSUvEal9A+1oVA1CKcAv6jgEixM8In0Iz
 Nv2g==
X-Gm-Message-State: APjAAAVRePR/zB7fECwERAUl5LSlJtp1yRiyijSUVRurVtAS45jex5vk
 I3CSjSA/osQ4F+sZKycpALa/35rcT3NykSVgBy85IeWB
X-Google-Smtp-Source: APXvYqxkhx0llAYDUIO95F4fr1oimPdUOJTrdli/3FZ3eNKt0/gubklpxc3X1vSLUfY5zGqgL/CBZU73MDVoteA/E8Q=
X-Received: by 2002:a5d:8404:: with SMTP id i4mr2354620ion.146.1561519036262; 
 Tue, 25 Jun 2019 20:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190625122709.11846-1-vaibhav@linux.ibm.com>
 <20190625122709.11846-2-vaibhav@linux.ibm.com>
In-Reply-To: <20190625122709.11846-2-vaibhav@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 26 Jun 2019 13:17:05 +1000
Message-ID: <CAOSf1CFSne2QR+e5Sx9iWvCyaNLF4gc2gwntYDVK1=O1eCKVwg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] powerpc/pseries: Update SCM hcall op-codes in
 hvcall.h
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2019 at 10:27 PM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
> Update the hvcalls.h to include op-codes for new hcalls introduce to
> manage SCM memory. Also update existing hcall definitions to reflect
> current papr specification for SCM.
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Change-log:
>
> v2:
> * None new patch in this series.
> ---
>  arch/powerpc/include/asm/hvcall.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index 463c63a9fcf1..1f5f917dae8c 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -302,9 +302,14 @@
>  #define H_SCM_UNBIND_MEM        0x3F0
>  #define H_SCM_QUERY_BLOCK_MEM_BINDING 0x3F4
>  #define H_SCM_QUERY_LOGICAL_MEM_BINDING 0x3F8
> -#define H_SCM_MEM_QUERY                0x3FC
> +#define H_SCM_UNBIND_ALL        0x3FC
>  #define H_SCM_BLOCK_CLEAR       0x400

The BLOCK_CLEAR hcall was removed from the spec and the 0x400 hcall
number is now used by H_SCM_HEALTH.

> -#define MAX_HCALL_OPCODE       H_SCM_BLOCK_CLEAR
> +#define H_SCM_PERFORMANCE_STATS 0x418
> +#define MAX_HCALL_OPCODE       H_SCM_PERFORMANCE_STATS
> +
> +/* Scope args for H_SCM_UNBIND_ALL */
> +#define H_UNBIND_SCOPE_ALL (0x1)
> +#define H_UNBIND_SCOPE_DRC (0x2)
>
>  /* H_VIOCTL functions */
>  #define H_GET_VIOA_DUMP_SIZE   0x01
> --
> 2.21.0
>
