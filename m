Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F4090193CC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 11:14:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p17X645pzDqmC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 21:14:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p15X2pr2zDqhm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 21:13:03 +1100 (AEDT)
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M3DFj-1jEN9r0CFx-003cSU for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar
 2020 11:07:46 +0100
Received: by mail-qt1-f173.google.com with SMTP id m33so4731485qtb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 03:07:45 -0700 (PDT)
X-Gm-Message-State: ANhLgQ2+RkFWJDNWTRDPKrorJJe7OYwnRApxvlu/O8tUqFOHMZgKto+F
 x05KSZWNqu7rphGgn1WmPqoTzlJAUN7mbukHhOg=
X-Google-Smtp-Source: ADFU+vtn4zzbgXz0JiR+4r/VnSMlC2pOUeyfguA66WQGjarHPZXvLUyw5ij+hMENKb2uojnLZ7CO+lHSprkkhHJr/VE=
X-Received: by 2002:aed:20e3:: with SMTP id 90mr7165503qtb.142.1585217264913; 
 Thu, 26 Mar 2020 03:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <1576170032-3124-1-git-send-email-youri.querry_1@nxp.com>
 <1576170032-3124-3-git-send-email-youri.querry_1@nxp.com>
In-Reply-To: <1576170032-3124-3-git-send-email-youri.querry_1@nxp.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 26 Mar 2020 11:07:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a11TJvNZ=uibXe8v6aHc3E8YTPeReN43=OW=3V7Rd7MNw@mail.gmail.com>
Message-ID: <CAK8P3a11TJvNZ=uibXe8v6aHc3E8YTPeReN43=OW=3V7Rd7MNw@mail.gmail.com>
Subject: Re: [PATCH 2/3] soc: fsl: dpio: QMAN performance improvement.
 Function pointer indirection.
To: Youri Querry <youri.querry_1@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:jdSFvq4dLZCWWFAK814h8DO4IiK8TqAoSF6vQUAlAjw9SHqmb6B
 IwE8QYyPdGXVWwC0KNjo2cnQ0sHFLu8wWnMnhDm76Ae+r1luQIjGbl/riN9lrPa/OXmxiSx
 NELNHBIqL82OGi8F2MUU0S7OZleUgDrQ8+Edou9ssb/PwUvPr5Vmd7BJdLQ5bMyqtRwfIWU
 e894LVE5ZT0YB1FfGE8CA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:g63kPKWKwqQ=:atjoKvW77+zHCUhlr/xe6N
 Ih4lY16Pp1XVBEwibeu1G4IWdollBtfeJxRIx5uYmhQ8Q3vlZsSZjRw+jKvy7zd9YT5PL+txa
 xL03Q6LPL6sn05+WJ9a7MHTxVNVyIMRWzUAZq5OAqBh31ePo6gD9F+YIqFw27Kk3CCqj+XfEZ
 0oJFb0Ef3QBzoMflQYv3TsrW+IQKjmBiD3PP3YAEgzJJL7/VMJq5biC27cCcSbx79yECtU3BA
 Q8B6wSwbVDm9TEPdjJAEOtxENhmrIq5iPVL+FRCQo38IU81NjAKzosJ+5/Aaz3dQ4u7coWNcf
 G+s48edJqgjLS8evqaQZocIco3KaSVIwQvnKEMzAJNgCNY/eFu7TAge4AX4PUBxzWEhCdxXAr
 r/5NLYgKDkaLg7/xP9ossOj3J0dAm1XppXP+eRMPRiXXB77PRFWYQCRKj/BOXzD0W58Lh5ksC
 CTNywPITzflhh//MxqFruyTLyM7X5VYEY31U0qf2HNtr868uG3eeew28W9uW2XPMf3Idkd10M
 MjKwwzE8mo+By96Ugn1e9z2uWZ0QYw5k0RNTT/SfDwFMQd1WtgGFJDNbY8VOZtoa2FOeb3CNk
 +rfsep5oX8P0AjwYW4BSfcgWw8iYBAVhm79SJhmglSFH1WBZ/GHu+bGeokNMczoLPQlEgXZtG
 Jcr2uDih565U79bI27E86cUUSnaTjnjuR0XPI0FTtj4zR5K1jHDlkdJeB5FIiOh7IsMR623IX
 f0qI5X9eV9UK8pwVzkgACoTxkANJ8qUtCKq6wIBOOUpDwSwUpkyIKgs0vR+05JSwQyNT8+ycG
 q7QupVVnVPobKIdllRwIxNS3s10P1SU2z+iaXbyx8J9OU24Sho=
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
Cc: Roy Pledge <roy.pledge@nxp.com>,
 Alexandru Marginean <alexandru.marginean@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 12, 2019 at 6:02 PM Youri Querry <youri.querry_1@nxp.com> wrote:
>
> We are making the access decision in the initialization and
> setting the function pointers accordingly.
>
> Signed-off-by: Youri Querry <youri.querry_1@nxp.com>
> ---
>  drivers/soc/fsl/dpio/qbman-portal.c | 451 +++++++++++++++++++++++++++++++-----
>  drivers/soc/fsl/dpio/qbman-portal.h | 129 ++++++++++-
>  2 files changed, 507 insertions(+), 73 deletions(-)

While merging pull requests, I came across some style issues with this driver.
I'm pulling it anyway, but please have another look and fix these for the next
release, or send a follow-up patch for the coming merge window.

>
> diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
> index 5a37ac8..0ffe018 100644
> --- a/drivers/soc/fsl/dpio/qbman-portal.c
> +++ b/drivers/soc/fsl/dpio/qbman-portal.c
> @@ -83,6 +83,82 @@ enum qbman_sdqcr_fc {
>         qbman_sdqcr_fc_up_to_3 = 1
>  };
>
> +/* Internal Function declaration */
> +static int qbman_swp_enqueue_direct(struct qbman_swp *s,
> +                                   const struct qbman_eq_desc *d,
> +                                   const struct dpaa2_fd *fd);
> +static int qbman_swp_enqueue_mem_back(struct qbman_swp *s,
> +                                     const struct qbman_eq_desc *d,
> +                                     const struct dpaa2_fd *fd);
> +static int qbman_swp_enqueue_multiple_direct(struct qbman_swp *s,
> +                                            const struct qbman_eq_desc *d,
> +                                            const struct dpaa2_fd *fd,
> +                                            uint32_t *flags,
> +                                            int num_frames);
> +static int qbman_swp_enqueue_multiple_mem_back(struct qbman_swp *s,
> +                                              const struct qbman_eq_desc *d,
> +                                              const struct dpaa2_fd *fd,
> +                                              uint32_t *flags,
> +                                              int num_frames);

Please try to avoid all static forward declarations. The coding style for the
kernel generally mandates that you define the functions in the order they
are used in, and have no such declarations, unless there is a recursion
that requires it. If you do have recursion, then please add a comment that
explains how you limit it to avoid overrunning the kernel stack.

> +const struct dpaa2_dq *qbman_swp_dqrr_next_direct(struct qbman_swp *s);
> +const struct dpaa2_dq *qbman_swp_dqrr_next_mem_back(struct qbman_swp *s);

Forward declarations for non-static functions in C code are much
worse, you should
never need these. If a function is shared between files, then put the
declaration
into a header file that is included by both, to ensure the prototypes match, and
if it's only used here, then make it 'static'.

> +/* Function pointers */
> +int (*qbman_swp_enqueue_ptr)(struct qbman_swp *s,
> +                            const struct qbman_eq_desc *d,
> +                            const struct dpaa2_fd *fd)
> +       = qbman_swp_enqueue_direct;
> +
> +int (*qbman_swp_enqueue_multiple_ptr)(struct qbman_swp *s,
> +                                     const struct qbman_eq_desc *d,
> +                                     const struct dpaa2_fd *fd,
> +                                     uint32_t *flags,
> +                                            int num_frames)
> +       = qbman_swp_enqueue_multiple_direct;

This looks like you just have an indirect function pointer with a
single possible
implementation. This is less of a problem, but until you have a way to safely
override these at runtime, it may be better to simplify this by using direct
function calls.

       Arnd
