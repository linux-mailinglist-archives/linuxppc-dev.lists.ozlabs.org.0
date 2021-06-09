Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A0D3A0FB9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 11:33:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0MP50RBJz3bvq
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 19:33:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ADcj1YVv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f;
 helo=mail-il1-x12f.google.com; envelope-from=idryomov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ADcj1YVv; dkim-atps=neutral
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0MNd3DJJz300S
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 19:33:19 +1000 (AEST)
Received: by mail-il1-x12f.google.com with SMTP id z1so24665557ils.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Jun 2021 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mhMcjERsi3wx3J0HCHYpS+goiMXBDBgg8cMNxlYjvGA=;
 b=ADcj1YVvHTLC+vKMpsqWPDJsBSDbQj9Juth1j7LfkjKpeyQiAv4eLJia7JtZshRFtJ
 A+TDHANIoo9IOJ4Kh0lYPvrrYa5nHWPVMBPmA405nRsS3sz38uj/ZBeAXl2ZMbNQjV+D
 mqkGmibxA5nlTggMZR8xaJL9mgWWlN0qvJ13j0sbvH5mcxMOF9754ReExqahIfdHqL2I
 NGrYqKJ6VLkatC3yXMel7BVvJXeid1JTMV2nRKXWSqgMLC4VnNuNxzIDSde7bQegncwu
 8i1TuPOBXCJ8KzJ7C/7oFxid3upfTcHVU7lyPDQqvDi7b+rtEOCs4e9uougdvb5+gY72
 zPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhMcjERsi3wx3J0HCHYpS+goiMXBDBgg8cMNxlYjvGA=;
 b=YTUeB1COS/iy54u3IoGdla2SdNT6eZ++tY8mft0oOJ2YTI8JNFUlYT20Bb8up1BDh2
 u6dy7zJUw5FWFth+OK11vmfae5NADvAj8mBp/vhsSIxrDlQFqC6S6zKYfK3n6ZMwSEAe
 zNSJhty2c8qR2CDICH/pWDFyiH9gfmDaSbM01nO9iyaIxOB74v7Rj2Ky4s6nRvHbKqmq
 rsrtZIqDA5fCQm5d1jA36hL37DrchrO72mLbAqTBkd1VQoWDHDQOhc4mU8LI+N7dg54t
 Y2optFW7g2s9hjWgOEdBm1ILR9rEVvo9DgpTSTFzNYv1Ct3gUD/Rc8dh1EKkAKbiFPIR
 zBIg==
X-Gm-Message-State: AOAM533vIzw/tMFjT2AJ1bs6WMgIc4OlrhicZz53TMZ/ORX4MEUFilxq
 lSb1cOOibMzI/fvCbOAX5mS1Ew0MHwWoyuv8Ms8=
X-Google-Smtp-Source: ABdhPJwAXk5XLhiYZ2SCv5KKecZJLPTCdFzz10ao0FJv/DCA2fGlPOpnYQTjWTA/Q177jVl11ZJJ3bM2RHXJ7omJZKU=
X-Received: by 2002:a6b:287:: with SMTP id 129mr18520979ioc.182.1623231195095; 
 Wed, 09 Jun 2021 02:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210608160603.1535935-1-hch@lst.de>
 <20210608160603.1535935-5-hch@lst.de>
In-Reply-To: <20210608160603.1535935-5-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 9 Jun 2021 11:33:13 +0200
Message-ID: <CAOi1vP8Xe1ZqE8fe=8KcU00xDjRrvaRONAC_TYYctsE1dns0Og@mail.gmail.com>
Subject: Re: [PATCH 04/16] bvec: add a bvec_kmap_local helper
To: Christoph Hellwig <hch@lst.de>
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Snitzer <snitzer@redhat.com>, Geoff Levand <geoff@infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 LKML <linux-kernel@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>,
 dm-devel@redhat.com, Ceph Development <ceph-devel@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 8, 2021 at 6:06 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Add a helper to call kmap_local_page on a bvec.  There is no need for
> an unmap helper given that kunmap_local accept any address in the mapped
> page.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/bvec.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/include/linux/bvec.h b/include/linux/bvec.h
> index 883faf5f1523..d64d6c0ceb77 100644
> --- a/include/linux/bvec.h
> +++ b/include/linux/bvec.h
> @@ -7,6 +7,7 @@
>  #ifndef __LINUX_BVEC_H
>  #define __LINUX_BVEC_H
>
> +#include <linux/highmem.h>
>  #include <linux/bug.h>
>  #include <linux/errno.h>
>  #include <linux/limits.h>
> @@ -183,4 +184,9 @@ static inline void bvec_advance(const struct bio_vec *bvec,
>         }
>  }
>
> +static inline void *bvec_kmap_local(struct bio_vec *bvec)
> +{
> +       return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
> +}
> +
>  #endif /* __LINUX_BVEC_H */

Might be useful to add the second sentence of the commit message as
a comment for bvec_kmap_local().  It could be expanded to mention the
single-page bvec caveat too.

Thanks,

                Ilya
