Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2462D1FA1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 01:56:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqhZL6mCjzDqd3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 11:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=fY2O7iKA; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqhXV4klJzDqbX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 11:54:29 +1100 (AEDT)
Received: by mail-ej1-x644.google.com with SMTP id qw4so22185331ejb.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Dec 2020 16:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O9Ljz2CX6PmkxdkkytRGD21+6+ovkmrkrH5sYvGUqSA=;
 b=fY2O7iKAKS1idqegr8ckD+BEsPJHt7ZKxpUO8Lxl4h5mTl/Zy7Ood5K5ki4aA5U7Zu
 /f4ieAuXHa2zvsRweccNUEWBlU3EXgXJLWNbM4PCnVQkH2Ti9LUtDloh8OfqWX+FMlcD
 Kd+UGculbJa/BI6N948CrX3pyLee06c47U5tWZ1BQgL8+Uxd5S7v0B92eKLN/cFiOgr4
 2uEPjV4H5KeETzpzfWhSOfHt/q4enqsITzRr5derGvYXqcQQ2GFn6MwgAK/gMnnYplDY
 yYps0B7Gb+PVF+IKKUJsH2mDjqgXZfgfDC1dHySg5fc7rhnVvWMXLHWfrtY97KlAZ7Nz
 FFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9Ljz2CX6PmkxdkkytRGD21+6+ovkmrkrH5sYvGUqSA=;
 b=gDoCYT67ifMLJVESnv7Enx9bOtw84OGv3KBe8/BvPVidY1Tc9NZ9MRsKrgHkOfiv7V
 xidBoR2emwDtRciihd/DO1IQQ/CDyhKAC3RIDnh/BilBVU+hCZoifqz8oQgIR8CB5AKK
 i2ZP4W9Ggs1cZyr/SYoHiVM1rmy55g7Xc06HJ0pqE1zXdTS0M4bAK9Ar/oCBUqiRClub
 9bxXpawIca/FuufXC+HR/RZWHT3HqBAX3F4FNtWhe1ZR0zoWhsLYD5XPQQvyFlEq5oiX
 S+gzs437cUClJVuI/wHTajBLPjVnVq+YE7yzwjCIJkumdN5XTBiJGUQlqk2JrtVyMUlX
 wP5w==
X-Gm-Message-State: AOAM533LiRcQA5pW8gx3RQENteqO51NZHF8eUDKTOyBsLuohFezXKBmW
 6UJb71Z+L6V196FXxyqDkyyI6X3jjI0GxVpauGKneA==
X-Google-Smtp-Source: ABdhPJx5IHKEuf6kHbQH5LExn+Dj7vCgfdVf9fM58IltvGIEMqiFxKGoXM/HGB2RMLVJ+/IFhna53PO5iE5pzZo6V/E=
X-Received: by 2002:a17:906:518a:: with SMTP id
 y10mr21614856ejk.323.1607388863459; 
 Mon, 07 Dec 2020 16:54:23 -0800 (PST)
MIME-Version: 1.0
References: <20201108211549.122018-1-vaibhav@linux.ibm.com>
In-Reply-To: <20201108211549.122018-1-vaibhav@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 7 Dec 2020 16:54:21 -0800
Message-ID: <CAPcyv4h0PAPyYoea2oxqw_mOZ-Ec-o1MwcdSN0gf5UXqZqjafQ@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/2] libnvdimm: Introduce ND_CMD_GET_STAT to retrieve
 nvdimm statistics
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
Cc: Santosh Sivaraj <santosh@fossix.org>, Ira Weiny <ira.weiny@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ add perf maintainers ]

On Sun, Nov 8, 2020 at 1:16 PM Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>
> Implement support for exposing generic nvdimm statistics via newly
> introduced dimm-command ND_CMD_GET_STAT that can be handled by nvdimm
> command handler function and provide values for these statistics back
> to libnvdimm. Following generic nvdimm statistics are defined as an
> enumeration in 'uapi/ndctl.h':
>
> * "media_reads" : Number of media reads that have occurred since reboot.
> * "media_writes" : Number of media writes that have occurred since reboot.
> * "read_requests" : Number of read requests that have occurred since reboot.
> * "write_requests" : Number of write requests that have occurred since reboot.

Perhaps document these as "since device reset"? As I can imagine some
devices might have a mechanism to reset the count outside of "reboot"
which is a bit ambiguous.

> * "total_media_reads" : Total number of media reads that have occurred.
> * "total_media_writes" : Total number of media writes that have occurred.
> * "total_read_requests" : Total number of read requests that have occurred.
> * "total_write_requests" : Total number of write requests that have occurred.
>
> Apart from ND_CMD_GET_STAT ioctl these nvdimm statistics are also
> exposed via sysfs '<nvdimm-device>/stats' directory for easy user-space
> access like below:
>
> /sys/class/nd/ndctl0/device/nmem0/stats # tail -n +1 *
> ==> media_reads <==
> 252197707602
> ==> media_writes <==
> 20684685172
> ==> read_requests <==
> 658810924962
> ==> write_requests <==
> 404464081574

Hmm, I haven't looked but how hard would it be to plumb these to be
perf counter-events. So someone could combine these with other perf
counters?

> In case a specific nvdimm-statistic is not supported than nvdimm
> command handler function can simply return an error (e.g -ENOENT) for
> request to read that nvdimm-statistic.

Makes sense, but I expect the perf route also has a way to enumerate
which statistics / counters are supported. I'm not opposed to also
having them in sysfs, but I think perf support should be a first class
citizen.

>
> The value for a specific nvdimm-stat is exchanged via newly introduced
> 'struct nd_cmd_get_dimm_stat' that hold a single statistics and a
> union of possible values types. Presently only '__s64' type of generic
> attributes are supported. These attributes are defined in
> 'ndvimm/dimm_devs.c' via a helper macro 'NVDIMM_STAT_ATTR'.
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  drivers/nvdimm/bus.c       |   6 ++
>  drivers/nvdimm/dimm_devs.c | 109 +++++++++++++++++++++++++++++++++++++
>  drivers/nvdimm/nd.h        |   5 ++
>  include/uapi/linux/ndctl.h |  27 +++++++++
>  4 files changed, 147 insertions(+)
>
> diff --git a/drivers/nvdimm/bus.c b/drivers/nvdimm/bus.c
> index 2304c6183822..d53564477437 100644
> --- a/drivers/nvdimm/bus.c
> +++ b/drivers/nvdimm/bus.c
> @@ -794,6 +794,12 @@ static const struct nd_cmd_desc __nd_cmd_dimm_descs[] = {
>                 .out_num = 1,
>                 .out_sizes = { UINT_MAX, },
>         },
> +       [ND_CMD_GET_STAT] = {
> +               .in_num = 1,
> +               .in_sizes = { sizeof(struct nd_cmd_get_dimm_stat), },
> +               .out_num = 1,
> +               .out_sizes = { sizeof(struct nd_cmd_get_dimm_stat), },
> +       },
>  };
>
>  const struct nd_cmd_desc *nd_cmd_dimm_desc(int cmd)
> diff --git a/drivers/nvdimm/dimm_devs.c b/drivers/nvdimm/dimm_devs.c
> index b59032e0859b..68aaa294def7 100644
> --- a/drivers/nvdimm/dimm_devs.c
> +++ b/drivers/nvdimm/dimm_devs.c
> @@ -555,6 +555,114 @@ static umode_t nvdimm_firmware_visible(struct kobject *kobj, struct attribute *a
>         return a->mode;
>  }
>
> +/* Request a dimm stat from the bus driver */
> +static int __request_dimm_stat(struct nvdimm_bus *nvdimm_bus,
> +                              struct nvdimm *dimm, u64 stat_id,
> +                              s64 *stat_val)
> +{
> +       struct nvdimm_bus_descriptor *nd_desc = nvdimm_bus->nd_desc;
> +       struct nd_cmd_get_dimm_stat stat = { .stat_id = stat_id };
> +       int rc, cmd_rc;
> +
> +       if (!test_bit(ND_CMD_GET_STAT, &dimm->cmd_mask)) {
> +               pr_debug("CMD_GET_STAT not set for bus driver 0x%lx\n",
> +                        nd_desc->cmd_mask);
> +               return -ENOENT;
> +       }
> +
> +       /* Is stat requested is known & bus driver supports fetching stats */
> +       if (stat_id <= ND_DIMM_STAT_INVALID || stat_id > ND_DIMM_STAT_MAX) {
> +               WARN(1, "Unknown stat-id(%llu) requested", stat_id);
> +               return -ENOENT;
> +       }
> +
> +       /* Ask bus driver for its stat value */
> +       rc = nd_desc->ndctl(nd_desc, dimm, ND_CMD_GET_STAT,
> +                           &stat, sizeof(stat), &cmd_rc);
> +       if (rc || cmd_rc) {
> +               pr_debug("Unable to request stat %lld. Error (%d,%d)\n",
> +                        stat_id, rc, cmd_rc);
> +               return rc ? rc : cmd_rc;
> +       }
> +
> +       /* Indicate error in case returned struct doesn't have the stat_id set */
> +       if (stat.stat_id != stat_id) {
> +               pr_debug("Invalid statid %llu returned\n", stat.stat_id);
> +               return -ENOENT;
> +       }
> +
> +       *stat_val = stat.int_val;
> +       return 0;
> +}
> +
> +static ssize_t nvdimm_stat_attr_show(struct device *dev,
> +                                    struct device_attribute *attr,
> +                                    char *buf)
> +{
> +       struct nvdimm_stat_attr *nattr = container_of(attr, typeof(*nattr), attr);
> +       struct nvdimm_bus *nvdimm_bus = walk_to_nvdimm_bus(dev);
> +       struct nvdimm *nvdimm = to_nvdimm(dev);
> +       s64 stat_val;
> +       int rc;
> +
> +       rc = __request_dimm_stat(nvdimm_bus, nvdimm, nattr->stat_id, &stat_val);
> +
> +       if (rc)
> +               return rc;
> +
> +       return snprintf(buf, PAGE_SIZE, "%lld", stat_val);
> +}
> +
> +static umode_t nvdimm_stats_visible(struct kobject *kobj, struct attribute *a, int n)
> +{
> +       struct nvdimm_stat_attr *nattr = container_of(a, typeof(*nattr), attr.attr);
> +       struct device *dev = container_of(kobj, typeof(*dev), kobj);
> +       struct nvdimm_bus *nvdimm_bus = walk_to_nvdimm_bus(dev);
> +       struct nvdimm *nvdimm = to_nvdimm(dev);
> +       u64 stat_val;
> +       int rc;
> +
> +       /* request dimm stat from bus driver and is success mark attribute as visible */
> +       rc = __request_dimm_stat(nvdimm_bus, nvdimm, nattr->stat_id, &stat_val);
> +       if (rc)
> +               pr_info("Unable to query stat %llu . Error(%d)\n", nattr->stat_id, rc);
> +
> +       return rc ? 0 : a->mode;
> +}
> +
> +#define NVDIMM_STAT_ATTR(_name, _stat_id)                              \
> +       struct nvdimm_stat_attr nvdimm_stat_attr_##_name = {                    \
> +               .attr = __ATTR(_name, 0400, nvdimm_stat_attr_show, NULL), \
> +               .stat_id = _stat_id,                                    \
> +       }
> +
> +static NVDIMM_STAT_ATTR(media_reads, ND_DIMM_STAT_MEDIA_READS);
> +static NVDIMM_STAT_ATTR(media_writes,  ND_DIMM_STAT_MEDIA_WRITES);
> +static NVDIMM_STAT_ATTR(read_requests, ND_DIMM_STAT_READ_REQUESTS);
> +static NVDIMM_STAT_ATTR(write_requests, ND_DIMM_STAT_WRITE_REQUESTS);
> +static NVDIMM_STAT_ATTR(total_media_reads, ND_DIMM_STAT_TOTAL_MEDIA_READS);
> +static NVDIMM_STAT_ATTR(total_media_writes, ND_DIMM_STAT_TOTAL_MEDIA_WRITES);
> +static NVDIMM_STAT_ATTR(total_read_requests, ND_DIMM_STAT_TOTAL_READ_REQUESTS);
> +static NVDIMM_STAT_ATTR(total_write_requests,  ND_DIMM_STAT_TOTAL_WRITE_REQUESTS);
> +
> +static struct attribute *nvdimm_stats_attributes[] = {
> +       &nvdimm_stat_attr_media_reads.attr.attr,
> +       &nvdimm_stat_attr_media_writes.attr.attr,
> +       &nvdimm_stat_attr_read_requests.attr.attr,
> +       &nvdimm_stat_attr_write_requests.attr.attr,
> +       &nvdimm_stat_attr_total_media_reads.attr.attr,
> +       &nvdimm_stat_attr_total_media_writes.attr.attr,
> +       &nvdimm_stat_attr_total_read_requests.attr.attr,
> +       &nvdimm_stat_attr_total_write_requests.attr.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group nvdimm_stats_group = {
> +       .name = "stats",
> +       .attrs = nvdimm_stats_attributes,
> +       .is_visible = nvdimm_stats_visible,
> +};
> +
>  static const struct attribute_group nvdimm_firmware_attribute_group = {
>         .name = "firmware",
>         .attrs = nvdimm_firmware_attributes,
> @@ -565,6 +673,7 @@ static const struct attribute_group *nvdimm_attribute_groups[] = {
>         &nd_device_attribute_group,
>         &nvdimm_attribute_group,
>         &nvdimm_firmware_attribute_group,
> +       &nvdimm_stats_group,
>         NULL,
>  };
>
> diff --git a/drivers/nvdimm/nd.h b/drivers/nvdimm/nd.h
> index 696b55556d4d..ea9e846ae245 100644
> --- a/drivers/nvdimm/nd.h
> +++ b/drivers/nvdimm/nd.h
> @@ -223,6 +223,11 @@ enum nd_async_mode {
>         ND_ASYNC,
>  };
>
> +struct nvdimm_stat_attr {
> +       struct device_attribute attr;
> +       u64 stat_id;
> +};
> +
>  int nd_integrity_init(struct gendisk *disk, unsigned long meta_size);
>  void wait_nvdimm_bus_probe_idle(struct device *dev);
>  void nd_device_register(struct device *dev);
> diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
> index 8cf1e4884fd5..81b76986b423 100644
> --- a/include/uapi/linux/ndctl.h
> +++ b/include/uapi/linux/ndctl.h
> @@ -97,6 +97,31 @@ struct nd_cmd_clear_error {
>         __u64 cleared;
>  } __packed;
>
> +/* Various generic dimm stats that can be reported */
> +enum {
> +       ND_DIMM_STAT_INVALID = 0,
> +       ND_DIMM_STAT_MEDIA_READS = 1,  /* Media reads after power cycle */
> +       ND_DIMM_STAT_MEDIA_WRITES = 2, /* Media writes after power cycle */
> +       ND_DIMM_STAT_READ_REQUESTS = 3, /* Read requests after power cycle */
> +       ND_DIMM_STAT_WRITE_REQUESTS = 4, /* Write requests after power cycle */
> +       ND_DIMM_STAT_TOTAL_MEDIA_READS = 5, /* Total Media Reads */
> +       ND_DIMM_STAT_TOTAL_MEDIA_WRITES = 6, /* Total Media Writes */
> +       ND_DIMM_STAT_TOTAL_READ_REQUESTS = 7, /* Total Read Requests */
> +       ND_DIMM_STAT_TOTAL_WRITE_REQUESTS = 8, /* Total Write  Requests */
> +       ND_DIMM_STAT_MAX = 8,
> +};
> +
> +struct nd_cmd_get_dimm_stat {
> +       /* See enum above for valid values */
> +       __u64 stat_id;
> +
> +       /* Holds a single dimm stat value */
> +       union {
> +               __s64 int_val;
> +               char  str_val[120];
> +       };
> +} __packed;

Is this needed? Especially if perf has the counters, and sysfs
optionally has the counters, does the ioctl path also need to be
plumbed?
