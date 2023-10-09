Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 170A27BD2CB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 07:23:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3nVZ53TVz3cV4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 16:23:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.41; helo=mail-pj1-f41.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3nV46YBPz2xdT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 16:22:35 +1100 (AEDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2773f2e599cso2243628a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Oct 2023 22:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696828952; x=1697433752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKDjDbJ7FjBDQQgX7EI5ljX+mPg09NnPyujEusdUD2c=;
        b=TGcSscvT7XtciCSDy5s4bxlgLVwcP9k2Ew0ebU0/OmfJ1wZMSLudGE7xmD6lapj7Yw
         v9mJSdw68y2i4bsiqCU/kyM3MtIiCLvJQ6dw6qgdC73gGW9Gqre/3myIleqqWYVJ6/en
         I4O7uwePEe3lsWXrIWnU+6g8zAcAGSOTZntJsBcO2lmlIOAptCoexFUAPJrmIS+XcMmf
         Ye/P7t9JtFwW1iOiMsz+JebvJjmzIjL9hArWt7x4lzmFdpg0d+E5RLOmju5mPIH+gCbD
         LK0VpB9tvW9/DA+DsACwv4hFv1ltaNYVwHR9AHoMsmMtyfOtp0LZUqiNugQuYU9c+zlQ
         Ia8w==
X-Gm-Message-State: AOJu0YwenB0p6aXPscZKeUan0xklRM7zex8F8v5bLBvVfvT6NSVBEZSC
	OMZrE5aBqb3WrkIgUmIpNBTsof39N3PsR8j2wdk=
X-Google-Smtp-Source: AGHT+IENZzLxeNSXadpD69/vTTWQ9pE2S1iKF8DEI/1CBQYLuymTXAKGnyb44p79qCUIi+AxalU9sd7YfmeRpKOzu4w=
X-Received: by 2002:a17:90b:1c83:b0:274:616e:3fc4 with SMTP id
 oo3-20020a17090b1c8300b00274616e3fc4mr11154380pjb.34.1696828952468; Sun, 08
 Oct 2023 22:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230928075213.84392-1-atrajeev@linux.vnet.ibm.com>
 <CAM9d7cj0iLdrV6EYmo_oC9M_32fuRVv_geBPz4GJv41jZR5WNQ@mail.gmail.com> <63F6D59C-3C40-4E39-BC63-4CB2DDAD0F47@linux.vnet.ibm.com>
In-Reply-To: <63F6D59C-3C40-4E39-BC63-4CB2DDAD0F47@linux.vnet.ibm.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Sun, 8 Oct 2023 22:22:21 -0700
Message-ID: <CAM9d7cjRD5TwgTCxb+Nc3xM6QJbHBu8=M-QMh=MkH+k1jOeLvg@mail.gmail.com>
Subject: Re: [PATCH V5 1/3] tools/perf: Add text_end to "struct dso" to save
 .text section size
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Ian Rogers <irogers@google.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Disha Goel <disgoel@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, Adrian Hunter <adrian.hunter@intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 2, 2023 at 11:47=E2=80=AFPM Athira Rajeev
<atrajeev@linux.vnet.ibm.com> wrote:
>
>
>
> > On 03-Oct-2023, at 9:58 AM, Namhyung Kim <namhyung@kernel.org> wrote:
> >
> > Hello,
> >
> > On Thu, Sep 28, 2023 at 12:52=E2=80=AFAM Athira Rajeev
> > <atrajeev@linux.vnet.ibm.com> wrote:
> >>
> >> Update "struct dso" to include new member "text_end".
> >> This new field will represent the offset for end of text
> >> section for a dso. For elf, this value is derived as:
> >> sh_size (Size of section in byes) + sh_offset (Section file
> >> offst) of the elf header for text.
> >>
> >> For bfd, this value is derived as:
> >> 1. For PE file,
> >> section->size + ( section->vma - dso->text_offset)
> >> 2. Other cases:
> >> section->filepos (file position) + section->size (size of
> >> section)
> >>
> >> To resolve the address from a sample, perf looks at the
> >> DSO maps. In case of address from a kernel module, there
> >> were some address found to be not resolved. This was
> >> observed while running perf test for "Object code reading".
> >> Though the ip falls beteen the start address of the loaded
> >> module (perf map->start ) and end address ( perf map->end),
> >> it was unresolved.
> >>
> >> Example:
> >>
> >>    Reading object code for memory address: 0xc008000007f0142c
> >>    File is: /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
> >>    On file address is: 0x1114cc
> >>    Objdump command is: objdump -z -d --start-address=3D0x11142c --stop=
-address=3D0x1114ac /lib/modules/6.5.0-rc3+/kernel/fs/xfs/xfs.ko
> >>    objdump read too few bytes: 128
> >>    test child finished with -1
> >>
> >> Here, module is loaded at:
> >>    # cat /proc/modules | grep xfs
> >>    xfs 2228224 3 - Live 0xc008000007d00000
> >>
> >> From objdump for xfs module, text section is:
> >>    text 0010f7bc  0000000000000000 0000000000000000 000000a0 2**4
> >>
> >> Here the offset for 0xc008000007f0142c ie  0x112074 falls out
> >> .text section which is up to 0x10f7bc.
> >>
> >> In this case for module, the address 0xc008000007e11fd4 is pointing
> >> to stub instructions. This address range represents the module stubs
> >> which is allocated on module load and hence is not part of DSO offset.
> >>
> >> To identify such  address, which falls out of text
> >> section and within module end, added the new field "text_end" to
> >> "struct dso".
> >>
> >> Reported-by: Disha Goel <disgoel@linux.ibm.com>
> >> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> >> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> >> Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
> >
> > For the series,
> > Acked-by: Namhyung Kim <namhyung@kernel.org>
> >
> > Thanks,
> > Namhyung
>
> Thanks for checking Namhyung,

Applied to perf-tools-next, thanks!
